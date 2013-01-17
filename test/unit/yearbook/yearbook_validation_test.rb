require 'minitest_helper'

class YearbookValidationTest < UnitTest

  test "is valid with factory attributes" do
    assert FactoryGirl.build(:yearbook).valid?
  end

  test "requires a school" do
    refute FactoryGirl.build(:yearbook, :school => false).valid?
  end

  test "requires a starting year" do
    refute FactoryGirl.build(:yearbook, :starting_year => false).valid?
  end

  test "requires a valid starting year" do
    assert FactoryGirl.build(:yearbook, :starting_year => Time.now.year).valid?
    refute FactoryGirl.build(:yearbook, :starting_year => 2005).valid?
    refute FactoryGirl.build(:yearbook, :starting_year => 2050).valid?
  end

  test "requires an ending year" do
    refute FactoryGirl.build(:yearbook, :ending_year => false).valid?
  end

  test "requires a valid ending year" do
    assert FactoryGirl.build(:yearbook, :ending_year => Time.now.year).valid?
    refute FactoryGirl.build(:yearbook, :ending_year => 2005).valid?
    refute FactoryGirl.build(:yearbook, :ending_year => 2050).valid?
  end

  test "makes the first yearbook current" do
    one = FactoryGirl.create(:yearbook)
    assert_equal 1, one.school.yearbooks.length
    assert one.current?
  end

  test "makes only the first yearbook current" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:yearbook, :school => one.school)
    assert true, one.current?
    refute two.current?
  end
end
