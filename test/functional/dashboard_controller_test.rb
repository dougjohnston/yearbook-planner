require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should redirect anonymous visitor" do
    get :index
    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "should allow authenticated user" do
    sign_in users(:one)
    get :index
    assert_response :success
  end
end
