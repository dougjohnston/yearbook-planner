require 'minitest_helper'

class DashboardControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should redirect anonymous visitor" do
    request.host = 'www.test.com'

    get :index
    assert_nil assigns(:school)
    assert_equal 'www', request.subdomain

    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "should allow authenticated user" do
    sign_in_user(:one)
    get :index
    assert_response :success
  end

  test "should set school based on subdomain" do
    sign_in_user(:one)
    get :index
    assert_equal 'aai', assigns(:school)['subdomain']
  end

  test "should raise a routing error if the school is unknown" do
    sign_in_user(:one, 'unknown')
    assert_raises(ActionController::RoutingError) do
      get :index
    end
  end
end
