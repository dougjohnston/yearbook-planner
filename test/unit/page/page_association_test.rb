require 'minitest_helper'

class PageAssociationTest < UnitTest
  setup do
    @page = FactoryGirl.create(:page)
  end

  test "can be assigned to a user" do
    user = FactoryGirl.build(:user)
    assert_difference '@page.users.count' do
      @page.users << user
    end
  end

  test "can be assigned to multiple users" do
    one = FactoryGirl.build(:user)
    two = FactoryGirl.build(:user)
    assert_difference '@page.users.count', +2 do
      @page.users << one
      @page.users << two
    end
  end
end
