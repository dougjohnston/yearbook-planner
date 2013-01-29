require 'minitest_helper'

class YearbooksControllerTest < FunctionalTest
  setup do
    sign_in_user
    @yearbook = FactoryGirl.create(:yearbook)
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
      post :create, yearbook: FactoryGirl.attributes_for(:old_yearbook, :school_id => @yearbook.school.id)
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
    put :update, id: @yearbook, yearbook: { theme: @yearbook.theme }
    assert_redirected_to yearbook_path(assigns(:yearbook))
  end

  test "should destroy yearbook" do
    assert_difference('Yearbook.count', -1) do
      delete :destroy, id: @yearbook
    end

    assert_redirected_to yearbooks_path
  end
end
