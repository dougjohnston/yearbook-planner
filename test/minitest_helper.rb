ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

# Minitest
require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require 'minitest/growl_notify'

# Support
require "factory_girl_rails"
require "mocha/setup"
require "turn/autorun"

Turn.config.format = :progress

class UnitTest < ActiveSupport::TestCase; end
class HelperTest < ActionView::TestCase; end

class IntegrationTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  Warden.test_mode!

  def sign_in_user(factory=:user, subdomain='aai')
    @host = "http://#{subdomain}.test.com"

    user = FactoryGirl.create(factory)
    login_as(user, :scope => :user)
    #@current_user = FactoryGirl.create(factory)
    #sign_in @current_user
  end
end

class FunctionalTest < ActionController::TestCase
  include Devise::TestHelpers

  def sign_in_user(factory=:user, subdomain='aai')
    request.host = "#{subdomain}.test.com"
    @current_user = FactoryGirl.create(factory)
    sign_in @current_user
  end
end
