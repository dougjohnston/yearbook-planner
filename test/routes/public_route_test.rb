require "minitest_helper"

class PublicRouteTest < IntegrationTest
  test "routes to public index with www" do
    host = 'www.example.com'
    assert_routing "/", :controller => "public", :action => "index"
  end

  test "routes to public index with no subdomain" do
    host = 'example.com'
    assert_routing "/", :controller => "public", :action => "index"
  end
end
