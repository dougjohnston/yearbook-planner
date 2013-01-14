require 'minitest_helper'

class YearbookMethodTest < MiniTest::Rails::ActiveSupport::TestCase
  # current!
  test "makes the current yearbook current" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:yearbook, :school => one.school)
    assert_equal one.school, two.school
    two.current!
    assert_equal false, one.current?
    assert_equal true, two.current?
  end

  test "only affects current school" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:yearbook)
    refute_equal one.school, two.school
    one.current!
    two.current!
    assert_equal true, one.current?
    assert_equal true, two.current?
  end
end
