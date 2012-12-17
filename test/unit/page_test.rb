require 'minitest_helper'

class PageTest < MiniTest::Rails::ActiveSupport::TestCase
  setup do
    @page = pages(:one)
  end

  test "can be assigned to a user" do
    user = users(:one)
    assert_difference '@page.users.count' do
      @page.users << user
    end
  end

  test "can be assigned to multiple users" do
    user_one = users(:one)
    user_two = users(:two)
    assert_difference '@page.users.count', +2 do
      @page.users << user_one
      @page.users << user_two
    end
  end
end
