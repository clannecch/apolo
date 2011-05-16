require 'test_helper'

class EmploymentsControllerTest < ActionController::TestCase
  setup do
    @employment = employments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employment" do
    assert_difference('Employment.count') do
      post :create, :employment => @employment.attributes
    end

    assert_redirected_to employment_path(assigns(:employment))
  end

  test "should show employment" do
    get :show, :id => @employment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @employment.to_param
    assert_response :success
  end

  test "should update employment" do
    put :update, :id => @employment.to_param, :employment => @employment.attributes
    assert_redirected_to employment_path(assigns(:employment))
  end

  test "should destroy employment" do
    assert_difference('Employment.count', -1) do
      delete :destroy, :id => @employment.to_param
    end

    assert_redirected_to employments_path
  end
end
