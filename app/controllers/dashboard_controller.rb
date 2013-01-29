class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @yearbook = @school.current_yearbook

    #flash[:notice] = "This is a basic notice"
    #flash[:info] = "This is a basic info notice"
    #flash[:alert] = "This is a basic alert"
    #flash[:success] = "This is a basic success notice"
  end
end
