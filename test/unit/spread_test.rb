require 'minitest_helper'

class SpreadTest < MiniTest::Rails::ActiveSupport::TestCase
  setup do
    @spread = FactoryGirl.create(:spread)
  end

  test "can be assigned to a user" do
    user = FactoryGirl.build(:user)
    assert_difference '@spread.users.count' do
      @spread.users << user
    end
  end

  test "can be assigned to multiple users" do
    one = FactoryGirl.build(:user)
    two = FactoryGirl.build(:user)
    assert_difference '@spread.users.count', +2 do
      @spread.users << one
      @spread.users << two
    end
  end
end
