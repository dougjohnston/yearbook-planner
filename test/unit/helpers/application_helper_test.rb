require 'test_helper'

class MockView < ActionView::Base
  include ApplicationHelper
end

class ApplicationHelperTest < ActionView::TestCase
  setup do
    @template = MockView.new
  end

  test "sets title" do
    @template.title("Proper")
    assert_equal "Proper", @template.content_for(:title)
  end
end
