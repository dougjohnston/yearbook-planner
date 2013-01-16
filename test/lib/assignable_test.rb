require 'minitest_helper'
require 'assignable'

#class MockEvent < ActiveRecord::Base
  #include Assignable
#end

class AssignableTest < UnitTest
  setup do
    @event = FactoryGirl.create(:event)
  end

  test "assign_to method exists" do
    assert_equal true, @event.methods.include?(:assign_to)
  end

  test "assigned? method exists" do
    assert_equal true, @event.methods.include?(:assigned?)
  end

  test "can assign to a user" do
    user = FactoryGirl.create(:user)
    assert_equal [user], @event.assign_to(user)
    assert_equal [user], @event.users
  end

  test "can assign to multiple users" do
    one = FactoryGirl.create(:user)
    two = FactoryGirl.create(:user)
    assert_equal [one,two], @event.assign_to([one, two])
    assert_equal [one,two], @event.users
  end
end

