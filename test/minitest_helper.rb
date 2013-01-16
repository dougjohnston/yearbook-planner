ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "minitest/autorun"
require "minitest/rails"
require 'minitest/growl_notify'

# Support
require "factory_girl_rails"
require "mocha/setup"
require "turn/autorun"

Turn.config.format = :progress

class UnitTest < ActiveSupport::TestCase
end

class IntegrationTest < ActionView::TestCase
end

class FunctionalTest < MiniTest::Rails::ActionController::TestCase
  include Devise::TestHelpers

  def sign_in_user(factory=:user, subdomain='aai')
    request.host = "#{subdomain}.test.com"
    @current_user = FactoryGirl.create(factory)
    sign_in @current_user
  end
end

