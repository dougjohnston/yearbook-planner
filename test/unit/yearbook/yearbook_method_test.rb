require 'minitest_helper'

class YearbookMethodTest < UnitTest
  # years
  test "returns a the yearbook years" do
    yearbook = FactoryGirl.build(:yearbook, :starting_year => 2013, :ending_year => 2014)
    assert_equal '2013-2014', yearbook.years
  end

  # title
  test "returns a nice title" do
    yearbook = FactoryGirl.build(:yearbook, :starting_year => 2013, :ending_year => 2014, :theme => "Survivors")
    assert_equal '2013-2014 &ndash; Survivors', yearbook.title
  end
  
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
