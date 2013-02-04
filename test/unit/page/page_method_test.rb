require 'minitest_helper'

class PageMethodTest < UnitTest
  setup do
    @page = FactoryGirl.build(:page)
  end

  # blank?
  test "is blank if no title exists" do
    @page.title = nil
    assert @page.blank?
  end

  test "is not blank if a title is present" do
    refute @page.blank?
  end
end
