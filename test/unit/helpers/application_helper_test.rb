require 'minitest_helper'

class MockView < ActionView::Base
  include ApplicationHelper
end

class ApplicationHelperTest < MiniTest::Rails::ActionView::TestCase
  #setup do
    #@template = MockView.new
  #end

  def helper
    @helper ||= MockView.new
  end

  test "sets title" do
    helper.title("Proper")
    assert_equal "Proper", helper.content_for(:title)
  end

  test "sets layout title for Devise controllers" do
    @school = schools(:one)
    assert_equal "AAI Login - yearbookplanner.com", devise_layout_title
  end

  #test "sets layout title for Appliaction controllers" do
    #@school = schools(:one)
    ##helper.title("Test Page")
    #helper.stub :content_for, 'Test Page' do 
      #assert_equal "AAI Test Page - yearbookplanner.com", application_layout_title
    #end
    ##mock.expect(:content_for, 'Test Page', [:title])
    ##puts helper.content_for(:title)
  #end
end
