require 'test_helper'

class InsuranceCompaniesControllerTest < ActionController::TestCase
  setup do
    @insurance_company = insurance_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_company" do
    assert_difference('InsuranceCompany.count') do
      post :create, :insurance_company => @insurance_company.attributes
    end

    assert_redirected_to insurance_company_path(assigns(:insurance_company))
  end

  test "should show insurance_company" do
    get :show, :id => @insurance_company.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @insurance_company.to_param
    assert_response :success
  end

  test "should update insurance_company" do
    put :update, :id => @insurance_company.to_param, :insurance_company => @insurance_company.attributes
    assert_redirected_to insurance_company_path(assigns(:insurance_company))
  end

  test "should destroy insurance_company" do
    assert_difference('InsuranceCompany.count', -1) do
      delete :destroy, :id => @insurance_company.to_param
    end

    assert_redirected_to insurance_companies_path
  end
end
