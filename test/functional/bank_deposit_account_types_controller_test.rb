require 'test_helper'

class BankDepositAccountTypesControllerTest < ActionController::TestCase
  setup do
    @bank_deposit_account_type = bank_deposit_account_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_deposit_account_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_deposit_account_type" do
    assert_difference('BankDepositAccountType.count') do
      post :create, :bank_deposit_account_type => @bank_deposit_account_type.attributes
    end

    assert_redirected_to bank_deposit_account_type_path(assigns(:bank_deposit_account_type))
  end

  test "should show bank_deposit_account_type" do
    get :show, :id => @bank_deposit_account_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bank_deposit_account_type.to_param
    assert_response :success
  end

  test "should update bank_deposit_account_type" do
    put :update, :id => @bank_deposit_account_type.to_param, :bank_deposit_account_type => @bank_deposit_account_type.attributes
    assert_redirected_to bank_deposit_account_type_path(assigns(:bank_deposit_account_type))
  end

  test "should destroy bank_deposit_account_type" do
    assert_difference('BankDepositAccountType.count', -1) do
      delete :destroy, :id => @bank_deposit_account_type.to_param
    end

    assert_redirected_to bank_deposit_account_types_path
  end
end
