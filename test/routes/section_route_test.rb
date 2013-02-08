require "minitest_helper"

class SectionRouteTest < IntegrationTest
  setup do
    sign_in_user
  end

  test "section index" do
    assert_routing "#{@host}/yearbooks/1/sections", :controller => "sections", :action => "index", :yearbook_id => "1"
  end

  test "section show" do
    assert_routing "#{@host}/sections/11", :controller => "sections", :action => "show", :id => "11"
  end
end
