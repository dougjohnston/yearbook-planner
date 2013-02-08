require "minitest_helper"

class PublicRouteTest < IntegrationTest
  test "public homepage" do
    assert_equal 'www', host.split('.')[0]
    assert_routing "/", :controller => "public", :action => "index"
  end
end
