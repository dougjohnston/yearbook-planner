require 'test_helper'

class SpreadsControllerTest < ActionController::TestCase
  setup do
    @spread = spreads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spreads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spread" do
    assert_difference('Spread.count') do
      post :create, spread: { position: @spread.position }
    end

    assert_redirected_to spread_path(assigns(:spread))
  end

  test "should show spread" do
    get :show, id: @spread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spread
    assert_response :success
  end

  test "should update spread" do
    put :update, id: @spread, spread: { position: @spread.position }
    assert_redirected_to spread_path(assigns(:spread))
  end

  test "should destroy spread" do
    assert_difference('Spread.count', -1) do
      delete :destroy, id: @spread
    end

    assert_redirected_to spreads_path
  end
end
