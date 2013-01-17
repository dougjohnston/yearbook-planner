require 'minitest_helper'

class SchoolMethodTest < UnitTest
  # current_yearbook
  test "returns nil if no yearbooks exist" do
    school = FactoryGirl.build(:school)
    assert_nil school.current_yearbook
  end

  test "returns the current yearbook" do
    school = FactoryGirl.create(:school_with_yearbooks)
    assert_equal 2, school.yearbooks.length
    assert_equal school.yearbooks.first, school.current_yearbook
  end

  # newest_yearbook
  test "returns nil if no yearbooks exist" do
    school = FactoryGirl.build(:school)
    assert_nil school.newest_yearbook
  end

  test "returns the newest yearbook" do
    school = FactoryGirl.create(:school)
    new = FactoryGirl.create(:yearbook, :school => school)
    old = FactoryGirl.create(:old_yearbook, :school => school)
    assert_equal new, school.newest_yearbook
  end

  # oldest_yearbook
  test "returns nil if no yearbooks exist" do
    school = FactoryGirl.build(:school)
    assert_nil school.oldest_yearbook
  end

  test "returns the newest yearbook" do
    school = FactoryGirl.create(:school)
    new = FactoryGirl.create(:yearbook, :school => school)
    old = FactoryGirl.create(:old_yearbook, :school => school)
    assert_equal old, school.oldest_yearbook
  end
end
