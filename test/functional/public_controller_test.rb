require 'minitest_helper'

class PublicControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should send anonymous visitor to the public homepage" do
    request.host = 'www.test.com'

    get :index
    assert_nil assigns(:school)
    assert_equal 'www', request.subdomain

    assert_response :success
  end

  test "should raise a routing error if the school is unknown" do
    sign_in_user(:one, 'unknown')
    assert_raises(ActionController::RoutingError) do
      get :index
    end
  end
end
