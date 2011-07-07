require 'test_helper'

class EmployeeRetentionConceptsControllerTest < ActionController::TestCase
  setup do
    @employee_retention_concept = employee_retention_concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_retention_concepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_retention_concept" do
    assert_difference('EmployeeRetentionConcept.count') do
      post :create, :employee_retention_concept => @employee_retention_concept.attributes
    end

    assert_redirected_to employee_retention_concept_path(assigns(:employee_retention_concept))
  end

  test "should show employee_retention_concept" do
    get :show, :id => @employee_retention_concept.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @employee_retention_concept.to_param
    assert_response :success
  end

  test "should update employee_retention_concept" do
    put :update, :id => @employee_retention_concept.to_param, :employee_retention_concept => @employee_retention_concept.attributes
    assert_redirected_to employee_retention_concept_path(assigns(:employee_retention_concept))
  end

  test "should destroy employee_retention_concept" do
    assert_difference('EmployeeRetentionConcept.count', -1) do
      delete :destroy, :id => @employee_retention_concept.to_param
    end

    assert_redirected_to employee_retention_concepts_path
  end
end
