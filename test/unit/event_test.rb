require 'minitest_helper'

class EventTest < UnitTest
  setup do
    @event = FactoryGirl.create(:event)
  end

  test "can be assigned to a user" do
    user = FactoryGirl.build(:user)
    assert_difference '@event.users.count' do
      @event.users << user
    end
  end

  test "can be assigned to multiple users" do
    one = FactoryGirl.build(:user)
    two = FactoryGirl.build(:user)
    assert_difference '@event.users.count', +2 do
      @event.users << one
      @event.users << two
    end
  end
end
