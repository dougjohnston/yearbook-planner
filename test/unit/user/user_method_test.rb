require 'minitest_helper'

class UserMethodTest < UnitTest
  setup do
    @user = FactoryGirl.build(:user)
  end

  # full_name
  test "returns full name" do
    assert_equal 'Harry Truman', @user.full_name
  end

  test "returns first name only if last name is nil" do
    @user.last_name = nil
    assert_equal 'Harry', @user.full_name
  end

  test "returns first name only if last name is blank" do
    @user.last_name = ''
    assert_equal 'Harry', @user.full_name
  end
end
