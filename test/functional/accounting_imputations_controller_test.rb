require 'test_helper'

class AccountingImputationsControllerTest < ActionController::TestCase
  setup do
    @accounting_imputation = accounting_imputations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_imputations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_imputation" do
    assert_difference('AccountingImputation.count') do
      post :create, :accounting_imputation => @accounting_imputation.attributes
    end

    assert_redirected_to accounting_imputation_path(assigns(:accounting_imputation))
  end

  test "should show accounting_imputation" do
    get :show, :id => @accounting_imputation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accounting_imputation.to_param
    assert_response :success
  end

  test "should update accounting_imputation" do
    put :update, :id => @accounting_imputation.to_param, :accounting_imputation => @accounting_imputation.attributes
    assert_redirected_to accounting_imputation_path(assigns(:accounting_imputation))
  end

  test "should destroy accounting_imputation" do
    assert_difference('AccountingImputation.count', -1) do
      delete :destroy, :id => @accounting_imputation.to_param
    end

    assert_redirected_to accounting_imputations_path
  end
end
