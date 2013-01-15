require 'minitest_helper'

class YearbookValidationTest < UnitTest

  test "is valid with factory attributes" do
    assert_equal true, FactoryGirl.build(:yearbook).valid?
  end

  test "requires a school" do
    assert_equal false, FactoryGirl.build(:yearbook, :school => false).valid?
  end

  test "requires a starting year" do
    assert_equal false, FactoryGirl.build(:yearbook, :starting_year => false).valid?
  end

  test "requires a valid starting year" do
    assert_equal true, FactoryGirl.build(:yearbook, :starting_year => Time.now.year).valid?
    assert_equal false, FactoryGirl.build(:yearbook, :starting_year => 2005).valid?
    assert_equal false, FactoryGirl.build(:yearbook, :starting_year => 2050).valid?
  end

  test "requires an ending year" do
    assert_equal false, FactoryGirl.build(:yearbook, :ending_year => false).valid?
  end

  test "requires a valid ending year" do
    assert_equal true, FactoryGirl.build(:yearbook, :ending_year => Time.now.year).valid?
    assert_equal false, FactoryGirl.build(:yearbook, :ending_year => 2005).valid?
    assert_equal false, FactoryGirl.build(:yearbook, :ending_year => 2050).valid?
  end

  test "makes the first yearbook current" do
    one = FactoryGirl.create(:yearbook)
    assert_equal 1, one.school.yearbooks.length
    assert_equal true, one.current?
  end

  test "makes only the first yearbook current" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:yearbook, :school => one.school)
    assert_equal true, one.current?
    assert_equal false, two.current?
  end
end
