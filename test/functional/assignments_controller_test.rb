require 'minitest_helper'

class AssignmentsControllerTest < FunctionalTest
  def setup
    force_logout # not sure why we need to do this here
  end

  test "should redirect anonymous visitor to a subdomain" do
    request.host = 'aai.test.com'
    get :index
    assert_redirected_to :new_user_session
  end
end
