require "minitest_helper"

class SpreadRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "spread index" do
    assert_routing "#{@host}/sections/1/spreads", :controller => "spreads", :action => "index", :section_id => "1"
  end

  test "spread show" do
    assert_routing "#{@host}/spreads/111", :controller => "spreads", :action => "show", :id => "111"
  end
end
