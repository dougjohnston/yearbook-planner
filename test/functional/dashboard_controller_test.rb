require 'minitest_helper'

class DashboardControllerTest < FunctionalTest
  test "should redirect anonymous visitor to a subdomain" do
    request.host = 'aai.test.com'
    get :show
    assert_redirected_to :new_user_session
  end

  test "should allow authenticated user" do
    sign_in_user
    get :show
    assert_response :success
  end

  test "should set current school based on subdomain" do
    sign_in_user
    get :show
    assert_equal 'aai', assigns[:current_school]['subdomain']
  end

  test "should set current yearbook based on school" do
    sign_in_user
    get :show
    assert_equal 'Survivors', assigns[:current_yearbook]['theme']
  end

  test "should raise a routing error if the school is unknown" do
    sign_in_user(:user, 'unknown')
    assert_raises(ActionController::RoutingError) do
      get :show
    end
  end
end
