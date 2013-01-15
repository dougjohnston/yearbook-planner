require 'minitest_helper'

class SectionTest < UnitTest
  setup do
    @section = FactoryGirl.create(:section)
  end

  test "can be assigned to a user" do
    user = FactoryGirl.build(:user)
    assert_difference '@section.users.count' do
      @section.users << user
    end
  end

  test "can be assigned to multiple users" do
    one = FactoryGirl.build(:user)
    two = FactoryGirl.build(:user)
    assert_difference '@section.users.count', +2 do
      @section.users << one
      @section.users << two
    end
  end
end
