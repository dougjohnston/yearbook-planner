require "minitest_helper"

class DeadlineRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "deadline index" do
    assert_routing "#{@host}/deadlines", :controller => "deadlines", :action => "index"
  end

  test "deadline show" do
    assert_routing "#{@host}/deadlines/1", :controller => "deadlines", :action => "show", :id => "1"
  end
end
