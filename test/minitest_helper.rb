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

# Simplified class names
class UnitTest < ActiveSupport::TestCase; end
class HelperTest < ActionView::TestCase; end

class IntegrationTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL

  include Warden::Test::Helpers
  Warden.test_mode!

  def sign_in_user(factory=:complete_user, subdomain='aai')
    @host = "http://#{subdomain}.test.com"
    @current_user = FactoryGirl.create(factory)
    login_as(@current_user, :scope => :user)
  end

  def sign_out_user
    logout(@current_user)
  end

  def teardown
    Warden.test_reset!
  end
end

class FunctionalTest < ActionController::TestCase
  include Devise::TestHelpers

  def sign_in_user(factory=:complete_user, subdomain='aai')
    request.host = "#{subdomain}.test.com"
    @current_user = FactoryGirl.create(factory)
    sign_in @current_user
  end

  def force_logout
    request.env['warden'].logout
  end
end
