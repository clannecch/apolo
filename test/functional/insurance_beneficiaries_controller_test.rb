require 'test_helper'

class InsuranceBeneficiariesControllerTest < ActionController::TestCase
  setup do
    @insurance_beneficiary = insurance_beneficiaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_beneficiaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_beneficiary" do
    assert_difference('InsuranceBeneficiary.count') do
      post :create, :insurance_beneficiary => @insurance_beneficiary.attributes
    end

    assert_redirected_to insurance_beneficiary_path(assigns(:insurance_beneficiary))
  end

  test "should show insurance_beneficiary" do
    get :show, :id => @insurance_beneficiary.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @insurance_beneficiary.to_param
    assert_response :success
  end

  test "should update insurance_beneficiary" do
    put :update, :id => @insurance_beneficiary.to_param, :insurance_beneficiary => @insurance_beneficiary.attributes
    assert_redirected_to insurance_beneficiary_path(assigns(:insurance_beneficiary))
  end

  test "should destroy insurance_beneficiary" do
    assert_difference('InsuranceBeneficiary.count', -1) do
      delete :destroy, :id => @insurance_beneficiary.to_param
    end

    assert_redirected_to insurance_beneficiaries_path
  end
end
