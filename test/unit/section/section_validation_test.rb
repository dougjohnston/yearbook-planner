require 'minitest_helper'

class SectionValidationTest < UnitTest
  setup do
    @section = FactoryGirl.build(:section)
  end

  test "is valid with valid attributes" do
    assert @section.valid?
  end

  # yearbook
  test "is invalid without a yearbook" do
    @section.yearbook = nil
    refute @section.valid?
  end

  # title
  test "is invalid without a title" do
    @section.title = nil
    refute @section.valid?
  end

end
