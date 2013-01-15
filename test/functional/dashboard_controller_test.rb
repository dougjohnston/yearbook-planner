require 'minitest_helper'

class DashboardControllerTest < FunctionalTest
  setup do
    sign_in_user
  end
  test "should route to the dashboard" do
    assert_routing "http://aai.test.com/dashboard", :controller => "dashboard", :action => "show"
  end

  test "should redirect anonymous visitor" do
    sign_out @current_user
    request.host = 'www.test.com'

    get :show
    assert_nil assigns(:school)
    assert_equal 'www', request.subdomain

    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "should allow authenticated user" do
    get :show
    assert_response :success
  end

  test "should set school based on subdomain" do
    get :show
    assert_equal 'aai', assigns(:school)['subdomain']
  end

  test "should raise a routing error if the school is unknown" do
    sign_out @current_user
    sign_in_user(:user, 'unknown')
    assert_raises(ActionController::RoutingError) do
      get :show
    end
  end
end
