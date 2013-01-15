require 'minitest_helper'

class DeadlinesControllerTest < FunctionalTest
  setup do
    sign_in_user
    @deadline = FactoryGirl.create(:deadline)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deadlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deadline" do
    assert_difference('Deadline.count') do
      post :create, deadline: { description: @deadline.description, due_date: @deadline.due_date, title: @deadline.title }
    end

    assert_redirected_to deadline_path(assigns(:deadline))
  end

  test "should show deadline" do
    get :show, id: @deadline.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deadline
    assert_response :success
  end

  test "should update deadline" do
    put :update, id: @deadline, deadline: { description: @deadline.description, due_date: @deadline.due_date, title: @deadline.title }
    assert_redirected_to deadline_path(assigns(:deadline))
  end

  test "should destroy deadline" do
    assert_difference('Deadline.count', -1) do
      delete :destroy, id: @deadline
    end

    assert_redirected_to deadlines_path
  end
end
