require 'minitest_helper'

class SectionAssociationTest < UnitTest
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

  test "can be assigned to a single deadline" do
    deadline = FactoryGirl.build(:deadline)
    @section.deadline = deadline
    assert_equal deadline, @section.deadline
  end
end
