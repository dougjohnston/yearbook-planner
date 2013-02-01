require 'minitest_helper'

class SpreadValidationTest < UnitTest
  setup do
    @spread = FactoryGirl.build(:spread)
  end

  test "is valid with valid attributes" do
    assert @spread.valid?
  end

  # title
  test "is invalid without a title" do
    @spread.title = nil
    refute @spread.valid?
  end

  # pages
  test "spawns two pages when created" do
    spread = FactoryGirl.create(:spread)
    assert spread.left_page
    assert spread.right_page
  end
end
