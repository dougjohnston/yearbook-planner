require 'minitest_helper'

class SpreadTest < MiniTest::Rails::ActiveSupport::TestCase
  setup do
    @spread = spreads(:one)
  end

  test "can be assigned to a user" do
    user = users(:one)
    assert_difference '@spread.users.count' do
      @spread.users << user
    end
  end

  test "can be assigned to multiple users" do
    user_one = users(:one)
    user_two = users(:two)
    assert_difference '@spread.users.count', +2 do
      @spread.users << user_one
      @spread.users << user_two
    end
  end
end
