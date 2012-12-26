require 'minitest_helper'

class DashboardControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should redirect anonymous visitor" do
    get :index
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
    puts "School #{assigns(:school)}"
    assert_equal assigns(:school)['subdomain'], 'aai'
  end
end
