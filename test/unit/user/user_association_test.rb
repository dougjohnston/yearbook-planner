require 'minitest_helper'

class UserAssociationTest < UnitTest
  setup do
    @user = FactoryGirl.create(:user)
  end

  test "can belong to a yearbook" do
    yearbook = FactoryGirl.build(:yearbook)
    assert_difference '@user.yearbooks.count' do
      @user.yearbooks << yearbook
    end
  end

  test "can belong to many yearbooks" do
    one = FactoryGirl.build(:yearbook)
    two = FactoryGirl.build(:yearbook)
    assert_difference '@user.yearbooks.count', +2 do
      @user.yearbooks << one
      @user.yearbooks << two
    end
  end

  test "can be assigned a section" do
    section = FactoryGirl.build(:section)
    assert_difference '@user.sections.count' do
      @user.sections << section
    end
  end

  test "can be assigned many sections" do
    one = FactoryGirl.build(:section)
    two = FactoryGirl.build(:section)
    assert_difference '@user.sections.count', +2 do
      @user.sections << one
      @user.sections << two
    end
  end

  test "can be assigned a spread" do
    spread = FactoryGirl.build(:spread)
    assert_difference '@user.spreads.count' do
      @user.spreads << spread
    end
  end

  test "can be assigned many spreads" do
    one = FactoryGirl.build(:spread)
    two = FactoryGirl.build(:spread)
    assert_difference '@user.spreads.count', +2 do
      @user.spreads << one
      @user.spreads << two
    end
  end

  test "can be assigned a page" do
    page = FactoryGirl.build(:page)
    assert_difference '@user.pages.count' do
      @user.pages << page
    end
  end

  test "can be assigned many pages" do
    one = FactoryGirl.build(:page)
    two = FactoryGirl.build(:page)
    assert_difference '@user.pages.count', +2 do
      @user.pages << one
      @user.pages << two
    end
  end

  test "can be assigned an event" do
    event = FactoryGirl.build(:event)
    assert_difference '@user.events.count' do
      @user.events << event
    end
  end

  test "can be assigned many events" do
    one = FactoryGirl.build(:event)
    two = FactoryGirl.build(:event)
    assert_difference '@user.events.count', +2 do
      @user.events << one
      @user.events << two
    end
  end
end
