require "minitest_helper"

class DashboardRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "main dashboard via root" do
    assert_recognizes({ :controller => 'dashboard', :action => 'show' }, "#{@host}/")
  end

  test "main dashboard directly" do
    assert_routing "#{@host}/dashboard", :controller => "dashboard", :action => "show"
  end
end
