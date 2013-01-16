require "minitest_helper"

class PublicSiteTest < IntegrationTest
  test "homepage has content" do
    visit root_path
    assert page.has_content?("public index")
  end
end
