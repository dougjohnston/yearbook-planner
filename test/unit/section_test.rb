require 'minitest_helper'

class SectionTest < MiniTest::Rails::ActiveSupport::TestCase
  setup do
    @section = sections(:one)
  end

  test "can be assigned to a user" do
    user = users(:one)
    assert_difference '@section.users.count' do
      @section.users << user
    end
  end

  test "can be assigned to multiple users" do
    user_one = users(:one)
    user_two = users(:two)
    assert_difference '@section.users.count', +2 do
      @section.users << user_one
      @section.users << user_two
    end
  end
end
