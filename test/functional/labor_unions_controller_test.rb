require 'test_helper'

class LaborUnionsControllerTest < ActionController::TestCase
  setup do
    @labor_union = labor_unions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:labor_unions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create labor_union" do
    assert_difference('LaborUnion.count') do
      post :create, :labor_union => @labor_union.attributes
    end

    assert_redirected_to labor_union_path(assigns(:labor_union))
  end

  test "should show labor_union" do
    get :show, :id => @labor_union.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @labor_union.to_param
    assert_response :success
  end

  test "should update labor_union" do
    put :update, :id => @labor_union.to_param, :labor_union => @labor_union.attributes
    assert_redirected_to labor_union_path(assigns(:labor_union))
  end

  test "should destroy labor_union" do
    assert_difference('LaborUnion.count', -1) do
      delete :destroy, :id => @labor_union.to_param
    end

    assert_redirected_to labor_unions_path
  end
end
