require 'minitest_helper'

class UserTest < MiniTest::Rails::ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "can belong to a yearbook" do
    yearbook = yearbooks(:one)
    assert_difference '@user.yearbooks.count' do
      @user.yearbooks << yearbook
    end
  end

  test "can belong to many yearbooks" do
    yearbook_one = yearbooks(:one)
    yearbook_two = yearbooks(:two)
    assert_difference '@user.yearbooks.count' , +2 do
      @user.yearbooks << yearbook_one
      @user.yearbooks << yearbook_two
    end
  end

  test "can be assigned a spread" do
    spread = spreads(:one)
    assert_difference '@user.spreads.count' do
      @user.spreads << spread
    end
  end
end
