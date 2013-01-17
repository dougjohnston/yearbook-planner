require 'minitest_helper'

class AssignableTest < UnitTest
  setup do
    @event = FactoryGirl.create(:event)
    @one = FactoryGirl.create(:user)
    @two = FactoryGirl.create(:user)
  end

  # assign_to
  test "can assign to a user" do
    assert_equal [@one], @event.assign_to(@one)
    assert_equal [@one], @event.users
  end

  test "can assign to multiple users passed as an array" do
    assert_equal [@one, @two], @event.assign_to([@one, @two])
    assert_equal [@one, @two], @event.users
  end

  test "can assign to multiple users passed as a list" do
    assert_equal [@one, @two], @event.assign_to(@one, @two)
    assert_equal [@one, @two], @event.users
  end

  # assigned?
  test "returns true if object is assigned" do
    @event.assign_to(@one)
    assert @event.assigned?
  end

  test "returns false if object is not assigned" do
    refute @event.assigned?
  end

  # workers
  test "returns an empty array if not assigned" do
    assert_empty @event.workers
  end

  test "returns an array of workers" do
    @event.assign_to([@one, @two])
    assert_equal [@one, @two], @event.workers
  end

  # number_of_workers
  test "returns zero if no workers have been assigned" do
    assert_equal 0, @event.number_of_workers
  end

  test "returns the number of workers assigned" do
    @event.assign_to(@one)
    assert_equal 1, @event.number_of_workers
  end
end

