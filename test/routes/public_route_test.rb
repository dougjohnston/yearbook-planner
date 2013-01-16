require "minitest_helper"

class PublicRouteTest < IntegrationTest
  test "public homepage" do
    assert_routing "/", :controller => "public", :action => "index"
  end
end
