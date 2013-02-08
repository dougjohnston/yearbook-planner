require "minitest_helper"

class AssignmentRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "assignment index" do
    assert_routing "#{@host}/assignments", :controller => "assignments", :action => "index"
  end

  test "assignment show" do
    assert_routing "#{@host}/assignments/1", :controller => "assignments", :action => "show", 
      :id => "1"
  end
end
