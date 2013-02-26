require 'minitest_helper'

class YearbookValidationTest < UnitTest

  test "is valid with factory attributes" do
    assert FactoryGirl.build(:yearbook).valid?
  end

  # school
  test "requires a school" do
    refute FactoryGirl.build(:yearbook, :school => nil).valid?
  end

  # starting_year
  test "requires a starting year" do
    refute FactoryGirl.build(:yearbook, :starting_year => false).valid?
  end

  test "requires a unique starting year" do
    school = FactoryGirl.create(:school)
    FactoryGirl.create(:yearbook, :school => school, :starting_year => 2012)
    refute FactoryGirl.build(:yearbook, :school => school, :starting_year => 2012).valid?
  end

  test "ignores other school's yearbooks" do
    FactoryGirl.create(:yearbook, :starting_year => 2012)
    assert FactoryGirl.build(:yearbook_with_other_school, :starting_year => 2012).valid?
  end

  test "requires a valid starting year" do
    assert FactoryGirl.build(:yearbook, :starting_year => Time.now.year).valid?
    refute FactoryGirl.build(:yearbook, :starting_year => 2005).valid?
    refute FactoryGirl.build(:yearbook, :starting_year => 2050).valid?
  end

  # ending_year
  test "requires an ending year" do
    refute FactoryGirl.build(:yearbook, :ending_year => false).valid?
  end

  test "requires a valid ending year" do
    assert FactoryGirl.build(:yearbook, :ending_year => Time.now.year).valid?
    refute FactoryGirl.build(:yearbook, :ending_year => 2005).valid?
    refute FactoryGirl.build(:yearbook, :ending_year => 2050).valid?
  end

  # current
  test "makes the first yearbook current" do
    one = FactoryGirl.create(:yearbook)
    assert_equal 1, one.school.yearbooks.length
    assert one.current?
  end

  test "makes only the first yearbook current" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:old_yearbook, :school => one.school)
    assert true, one.current?
    refute two.current?
  end
end
