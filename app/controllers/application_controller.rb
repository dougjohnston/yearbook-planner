class ApplicationController < ActionController::Base
  protect_from_forgery

  # Run everything through Devise; there is no public area.
  before_filter :authenticate_user!
end
