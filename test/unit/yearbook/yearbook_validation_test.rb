require 'minitest_helper'

class YearbookValidationTest < MiniTest::Rails::ActiveSupport::TestCase

  test "is valid with factory attributes" do
    assert_equal true, FactoryGirl.build(:yearbook).valid?
  end

  test "requires a school" do
    assert false
    skip
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
