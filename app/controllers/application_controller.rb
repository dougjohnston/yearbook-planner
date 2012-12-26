class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery

  # Run everything through Devise; there is no public area.
  before_filter :authenticate_user!
  before_filter :find_school_by_subdomain

  protected
  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  private
  def find_school_by_subdomain
    @school = School.where(:subdomain => request.subdomain).first || school_not_found
  end

  def school_not_found
    render 'public/school_not_found'
  end
end
