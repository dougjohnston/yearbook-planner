require "minitest_helper"

class DashboardPageTest < IntegrationTest
  test "when logged in, dashboard has content" do
    sign_in_user
    visit "#{@host}/"
    assert page.has_content?("Harry Truman")
  end

  test "when not logged in, " do
    FactoryGirl.create(:school)
    visit "http://aai.test.com/"
    assert page.has_xpath?("//title", "AAI Login - yearbookplanner.com")
  end
end
