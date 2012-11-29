require 'test_helper'

class YearbooksControllerTest < ActionController::TestCase
  setup do
    @yearbook = yearbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yearbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yearbook" do
    assert_difference('Yearbook.count') do
      post :create, yearbook: { ending_year: @yearbook.ending_year, school: @yearbook.school, starting_year: @yearbook.starting_year, theme: @yearbook.theme, title: @yearbook.title }
    end

    assert_redirected_to yearbook_path(assigns(:yearbook))
  end

  test "should show yearbook" do
    get :show, id: @yearbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yearbook
    assert_response :success
  end

  test "should update yearbook" do
    put :update, id: @yearbook, yearbook: { ending_year: @yearbook.ending_year, school: @yearbook.school, starting_year: @yearbook.starting_year, theme: @yearbook.theme, title: @yearbook.title }
    assert_redirected_to yearbook_path(assigns(:yearbook))
  end

  test "should destroy yearbook" do
    assert_difference('Yearbook.count', -1) do
      delete :destroy, id: @yearbook
    end

    assert_redirected_to yearbooks_path
  end
end
