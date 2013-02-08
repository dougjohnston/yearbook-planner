require "minitest_helper"

class EventRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "event index" do
    assert_routing "#{@host}/events", :controller => "events", :action => "index"
  end

  test "event show" do
    assert_routing "#{@host}/events/1", :controller => "events", :action => "show", :id => "1"
  end
end
