require "minitest_helper"

class DashboardPageTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "dashboard has content" do
    visit "#{@host}/"
    assert page.has_content?("Harry Truman")
  end
end
