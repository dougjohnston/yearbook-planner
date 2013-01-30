require 'minitest_helper'

class MockView < ActionView::Base
  include ApplicationHelper
end

class ApplicationHelperTest < HelperTest
  def view
    @view ||= MockView.new(nil,
                           :current_school => FactoryGirl.create(:school),
                           :current_yearbook => FactoryGirl.create(:yearbook))
  end

  #setup do
    #view.stubs(:school_short_name).returns("AAI")
  #end

  # current_school
  test "returns the current school object" do
    assert_equal "AAI", view.current_school.short_name
  end

  # current_yearbook
  test "returns the current yearbook object" do
    assert_equal "Survivors", view.current_yearbook.theme
  end
end
