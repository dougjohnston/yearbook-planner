require 'minitest_helper'

class AssignmentsControllerTest < FunctionalTest
  test "should redirect user, if not logged in" do
    request.host = 'aai.test.com'

    get :index
    assert_nil assigns(:current_school)
    assert_equal 'aai', request.subdomain

    assert_response :redirect
    assert_redirected_to :new_user_session
  end
end
