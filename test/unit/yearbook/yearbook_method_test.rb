require 'minitest_helper'

class YearbookMethodTest < UnitTest
  # current!
  test "makes a yearbook current" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:old_yearbook, :school => one.school)
    assert_same one.school, two.school
    two.current!
    refute one.reload.current?
    assert two.reload.current?
  end

  test "only affects current school" do
    one = FactoryGirl.create(:yearbook)
    two = FactoryGirl.create(:old_yearbook)
    refute_same one.school, two.school
    one.current! && two.current!
    assert one.reload.current?
    assert two.reload.current?
  end
end
