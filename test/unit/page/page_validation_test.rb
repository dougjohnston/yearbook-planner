require 'minitest_helper'

class PageValidationTest < UnitTest
  setup do
    @page = FactoryGirl.build(:page)
  end

  test "is valid with valid attributes" do
    assert @page.valid?
  end

  #test "is invalid without a title" do
    #@page.title = nil
    #@page.blank = false
    #refute @page.valid?
  #end

  #test "is valid without a title if the page is blank" do
    #@page.title = nil
    #@page.blank = true
    #assert @page.valid?
  #end

  #test "is invalid if it's a blank page with a title" do
    #@page.blank = true
    #refute @page.valid?
  #end
end
