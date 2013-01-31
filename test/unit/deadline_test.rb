require 'minitest_helper'

class DeadlineTest < UnitTest
  def deadline
    @deadline ||= FactoryGirl.create(:deadline)
  end

  # sanitized_title
  test "should return a processed title" do
    assert_equal 'deadline-1', deadline.sanitized_title
  end

  # spreads_for
  # TODO: Refactor this?
  test "should return spreads for a specific user" do
    user = FactoryGirl.create(:user)
    one = FactoryGirl.create(:spread, :deadline => deadline)
    two = FactoryGirl.create(:spread, :deadline => deadline)
    three = FactoryGirl.create(:spread, :deadline => deadline)
    one.users << user
    two.users << user
    assert_equal [one, two], deadline.spreads_for(user)
  end
end
