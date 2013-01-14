require 'minitest_helper'

class SchoolMethodTest < MiniTest::Rails::ActiveSupport::TestCase
  #setup do
    #@school = FactoryGirl.build(:school)
  #end

  # current_yearbook
  test "returns the current yearbook" do
    @school = FactoryGirl.create(:school_with_yearbooks)
    assert_equal 2, @school.yearbooks.length
    assert_equal @school.yearbooks.first, @school.current_yearbook
  end

  # newest_yearbook
  test "returns the newest yearbook" do
    skip "Add this test"
    assert false
  end
end
