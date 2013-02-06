require 'minitest_helper'

class DashboardControllerTest < FunctionalTest
  setup do
    sign_in_user(:complete_user)
  end

  test "should route to the dashboard" do
    assert_routing "http://aai.test.com/dashboard", :controller => "dashboard", :action => "show"
  end

  test "should redirect anonymous visitor with a subdomain" do
    sign_out @current_user
    request.host = 'aai.test.com'

    get :show
    assert_nil assigns(:current_school)
    assert_equal 'aai', request.subdomain

    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "should allow authenticated user" do
    get :show
    assert_response :success
  end

  test "should set current school based on subdomain" do
    get :show
    assert_equal 'aai', assigns[:current_school]['subdomain']
  end

  test "should set current yearbook based on school" do
    get :show
    assert_equal 'Survivors', assigns[:current_yearbook]['theme']
  end

  test "should raise a routing error if the school is unknown" do
    sign_out @current_user
    sign_in_user(:user, 'unknown')
    assert_raises(ActionController::RoutingError) do
      get :show
    end
  end
end
