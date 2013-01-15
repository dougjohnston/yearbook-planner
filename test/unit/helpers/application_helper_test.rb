require 'minitest_helper'

class MockView < ActionView::Base
  include ApplicationHelper
end

class ApplicationHelperTest < IntegrationTest
  def view
    @view ||= MockView.new
  end

  setup do
    view.stubs(:school_short_name).returns("AAI")
  end

  test "school short name" do
    @school = FactoryGirl.build(:school)
    assert_equal "AAI", school_short_name
  end

  test "sets title" do
    view.title("Proper")
    assert_equal "Proper", view.content_for(:title)
  end

  test "sets a banner title" do
    assert_equal "AAI Yearbook Planner", view.banner_title
  end

  test "sets layout title for auth controllers" do
    assert_equal "AAI Login - yearbookplanner.com", view.authentication_layout_title
  end

  test "sets layout title for Application controllers" do
    view.title("Test Page")
    assert_equal "AAI Test Page - yearbookplanner.com", view.application_layout_title
  end
end
