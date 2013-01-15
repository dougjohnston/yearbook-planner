ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "minitest/autorun"
require "minitest/rails"
require 'minitest/growl_notify'

# Support
require "factory_girl_rails"
require "mocha/setup"
require "turn/autorun"

Turn.config.format = :outline

class MiniTest::Rails::ActiveSupport::TestCase
  fixtures :all
end

class FunctionalTest < MiniTest::Rails::ActionController::TestCase
  include Devise::TestHelpers

  def sign_in_user(fixture, subdomain='aai')
    request.host = "#{subdomain}.test.com"
    @current_user = users(fixture)
    sign_in @current_user
  end
end

