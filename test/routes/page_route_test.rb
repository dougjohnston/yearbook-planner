require "minitest_helper"

class PageRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "page index" do
    assert_routing "#{@host}/spreads/1/pages", :controller => "pages", :action => "index", :spread_id => "1"
  end

  test "page show" do
    assert_routing "#{@host}/pages/111", :controller => "pages", :action => "show", :id => "111"
  end
end
