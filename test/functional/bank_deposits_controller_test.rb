require 'test_helper'

class BankDepositsControllerTest < ActionController::TestCase
  setup do
    @bank_deposit = bank_deposits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_deposits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_deposit" do
    assert_difference('BankDeposit.count') do
      post :create, :bank_deposit => @bank_deposit.attributes
    end

    assert_redirected_to bank_deposit_path(assigns(:bank_deposit))
  end

  test "should show bank_deposit" do
    get :show, :id => @bank_deposit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bank_deposit.to_param
    assert_response :success
  end

  test "should update bank_deposit" do
    put :update, :id => @bank_deposit.to_param, :bank_deposit => @bank_deposit.attributes
    assert_redirected_to bank_deposit_path(assigns(:bank_deposit))
  end

  test "should destroy bank_deposit" do
    assert_difference('BankDeposit.count', -1) do
      delete :destroy, :id => @bank_deposit.to_param
    end

    assert_redirected_to bank_deposits_path
  end
end
