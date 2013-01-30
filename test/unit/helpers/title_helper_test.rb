require 'minitest_helper'

class MockView < ActionView::Base
  include ApplicationHelper
  include TitleHelper
end

class TitleHelperTest < HelperTest
  def view
    @view ||= MockView.new(nil,
                           :current_school => FactoryGirl.create(:school),
                           :current_yearbook => FactoryGirl.create(:yearbook))
  end

  #setup do
    #view.stubs(:school_short_name).returns("AAI")
  #end

  # title
  test "sets title" do
    view.title("Proper")
    assert_equal "Proper", view.content_for(:title)
  end

  # banner_title
  test "sets a banner title" do
    assert_equal "AAI Yearbook Planner", view.banner_title
  end

  # authentication_layout_title
  test "sets layout title for auth controllers" do
    assert_equal "AAI Login - yearbookplanner.com", view.authentication_layout_title
  end

  # application_layout_title
  test "sets layout title for Application controllers" do
    view.title("Test Page")
    assert_equal "AAI Test Page - yearbookplanner.com", view.application_layout_title
  end

  # school_short_name
  test "school short name" do
    assert_equal "AAI", view.school_short_name
  end
end

