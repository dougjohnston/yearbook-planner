require 'minitest_helper'

class UserValidationTest < UnitTest
  setup do
    @user = FactoryGirl.build(:user)
  end
  test "is valid with valid attributes" do
    assert @user.valid?
  end

  # first_name
  test "is invalid without a first name" do
    @user.first_name = nil
    refute @user.valid?
  end

  test "is invalid with a blank first name" do
    @user.first_name = ''
    refute @user.valid?
  end

  # last name
  test "is invalid without a last name" do
    @user.last_name = nil
    refute @user.valid?
  end

  test "is invalid with a blank last name" do
    @user.last_name = ''
    refute @user.valid?
  end
end
