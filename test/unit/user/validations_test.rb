require 'minitest_helper'

class UserValidationTest < MiniTest::Rails::ActiveSupport::TestCase
  setup do
    @user = FactoryGirl.build(:user)
  end
  test "is valid with valid attributes" do
    assert_equal true, @user.valid?
  end

  # first_name
  test "is invalid without a first name" do
    @user.first_name = nil
    assert_equal false, @user.valid?
  end

  test "is invalid with a blank first name" do
    @user.first_name = ''
    assert_equal false, @user.valid?
  end

  # last name
  test "is invalid without a last name" do
    @user.last_name = nil
    assert_equal false, @user.valid?
  end

  test "is invalid with a blank last name" do
    @user.last_name = ''
    assert_equal false, @user.valid?
  end
end
