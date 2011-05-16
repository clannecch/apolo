require 'test_helper'

class EmployeeFamiliarsControllerTest < ActionController::TestCase
  setup do
    @employee_familiar = employee_familiars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_familiars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_familiar" do
    assert_difference('EmployeeFamiliar.count') do
      post :create, :employee_familiar => @employee_familiar.attributes
    end

    assert_redirected_to employee_familiar_path(assigns(:employee_familiar))
  end

  test "should show employee_familiar" do
    get :show, :id => @employee_familiar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @employee_familiar.to_param
    assert_response :success
  end

  test "should update employee_familiar" do
    put :update, :id => @employee_familiar.to_param, :employee_familiar => @employee_familiar.attributes
    assert_redirected_to employee_familiar_path(assigns(:employee_familiar))
  end

  test "should destroy employee_familiar" do
    assert_difference('EmployeeFamiliar.count', -1) do
      delete :destroy, :id => @employee_familiar.to_param
    end

    assert_redirected_to employee_familiars_path
  end
end
