class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery

  before_filter :set_instance_variables

  def current_school
    @current_school ||= find_school
  end

  def current_yearbook
    @current_yearbook ||= find_yearbook
  end

  protected
  def layout_by_resource
    if public_site?
      'public'
    elsif devise_controller?
      'authentication'
    else
      'application'
    end
  end

  private
  def set_instance_variables
    unless public_site?
      current_school
      current_yearbook
    end
  end

  def public_site?
    request.subdomain == 'www'
  end

  def find_school
    School.where(:subdomain => request.subdomain).first || school_not_found
  end

  def find_yearbook
    current_school.current_yearbook || nil
  end

  def school_not_found
    if Rails.env == 'development'
      School.where(:subdomain => 'aai').first
    else
      raise ActionController::RoutingError.new('Current School Not Found')
    end
  end
end
