ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "minitest/autorun"
require "minitest/rails"
require 'minitest/growl_notify'

# Support
require "factory_girl_rails"
require "mocha/setup"
require "turn/autorun"

class MiniTest::Rails::ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class FunctionalTest < MiniTest::Rails::ActionController::TestCase
  include Devise::TestHelpers

  def sign_in_user(fixture, subdomain='aai')
    request.host = "#{subdomain}.test.com"
    @current_user = users(fixture)
    sign_in @current_user
  end
end

