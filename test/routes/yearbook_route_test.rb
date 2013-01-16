require "minitest_helper"

class YearbookRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "yearbook index" do
    assert_routing "#{@host}/yearbooks", :controller => "yearbooks", :action => "index"
  end

  test "yearbook show" do
    assert_routing "#{@host}/yearbooks/1", :controller => "yearbooks", :action => "show", :id => "1"
  end

  test "yearbook index" do
    assert_routing "#{@host}/yearbooks", :controller => "yearbooks", :action => "index"
  end
end
