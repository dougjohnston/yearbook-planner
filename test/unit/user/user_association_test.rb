require 'minitest_helper'

class UserAssociationTest < MiniTest::Rails::ActiveSupport::TestCase
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
    assert_difference '@user.yearbooks.count', +2 do
      @user.yearbooks << yearbook_one
      @user.yearbooks << yearbook_two
    end
  end

  test "can be assigned a section" do
    section = sections(:one)
    assert_difference '@user.sections.count' do
      @user.sections << section
    end
  end

  test "can be assigned many sections" do
    section_one = sections(:one)
    section_two = sections(:two)
    assert_difference '@user.sections.count', +2 do
      @user.sections << section_one
      @user.sections << section_two
    end
  end

  test "can be assigned a spread" do
    spread = spreads(:one)
    assert_difference '@user.spreads.count' do
      @user.spreads << spread
    end
  end

  test "can be assigned many spreads" do
    spread_one = spreads(:one)
    spread_two = spreads(:two)
    assert_difference '@user.spreads.count', +2 do
      @user.spreads << spread_one
      @user.spreads << spread_two
    end
  end

  test "can be assigned a page" do
    page = pages(:one)
    assert_difference '@user.pages.count' do
      @user.pages << page
    end
  end

  test "can be assigned many pages" do
    page_one = pages(:one)
    page_two = pages(:two)
    assert_difference '@user.pages.count', +2 do
      @user.pages << page_one
      @user.pages << page_two
    end
  end

  test "can be assigned an event" do
    event = events(:one)
    assert_difference '@user.events.count' do
      @user.events << event
    end
  end

  test "can be assigned many events" do
    event_one = events(:one)
    event_two = events(:two)
    assert_difference '@user.events.count', +2 do
      @user.events << event_one
      @user.events << event_two
    end
  end
end
