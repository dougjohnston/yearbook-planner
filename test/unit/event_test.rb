require 'minitest_helper'

class EventTest < MiniTest::Rails::ActiveSupport::TestCase
  setup do
    @event = events(:one)
  end

  test "can be assigned to a user" do
    user = users(:one)
    assert_difference '@event.users.count' do
      @event.users << user
    end
  end

  test "can be assigned to multiple users" do
    user_one = users(:one)
    user_two = users(:two)
    assert_difference '@event.users.count', +2 do
      @event.users << user_one
      @event.users << user_two
    end
  end
end
