class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery

  before_filter :find_school_by_subdomain

  protected
  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  private
  def find_school_by_subdomain
    find_school unless request.subdomain == 'www'
  end

  def find_school
    @school = School.where(:subdomain => request.subdomain).first || school_not_found
  end

  def school_not_found
    raise ActionController::RoutingError.new('School Not Found')
  end
end
