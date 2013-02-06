require "minitest_helper"

class LaddersControllerTest < FunctionalTest
  setup do
    sign_in_user(:complete_user)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @current_user.school.yearbooks.first
    assert_response :success
  end
end
