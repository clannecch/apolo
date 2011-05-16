require 'test_helper'

class ContractModesControllerTest < ActionController::TestCase
  setup do
    @contract_mode = contract_modes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_modes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_mode" do
    assert_difference('ContractMode.count') do
      post :create, :contract_mode => @contract_mode.attributes
    end

    assert_redirected_to contract_mode_path(assigns(:contract_mode))
  end

  test "should show contract_mode" do
    get :show, :id => @contract_mode.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contract_mode.to_param
    assert_response :success
  end

  test "should update contract_mode" do
    put :update, :id => @contract_mode.to_param, :contract_mode => @contract_mode.attributes
    assert_redirected_to contract_mode_path(assigns(:contract_mode))
  end

  test "should destroy contract_mode" do
    assert_difference('ContractMode.count', -1) do
      delete :destroy, :id => @contract_mode.to_param
    end

    assert_redirected_to contract_modes_path
  end
end
