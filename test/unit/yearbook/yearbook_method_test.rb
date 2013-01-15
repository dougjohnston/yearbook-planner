require 'minitest_helper'

class YearbookMethodTest < MiniTest::Rails::ActiveSupport::TestCase
  # current!
  test "makes a yearbook current" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:old_yearbook, :school => one.school)
    assert_same one.school, two.school
    two.current!
    assert_equal false, one.reload.current?
    assert_equal true, two.reload.current?
  end

  test "only affects current school" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:old_yearbook)
    refute_same one.school, two.school
    one.current! && two.current!
    assert_equal true, one.reload.current?
    assert_equal true, two.reload.current?
  end
end
