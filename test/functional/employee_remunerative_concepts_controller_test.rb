require 'test_helper'

class EmployeeRemunerativeConceptsControllerTest < ActionController::TestCase
  setup do
    @employee_remunerative_concept = employee_remunerative_concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_remunerative_concepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_remunerative_concept" do
    assert_difference('EmployeeRemunerativeConcept.count') do
      post :create, :employee_remunerative_concept => @employee_remunerative_concept.attributes
    end

    assert_redirected_to employee_remunerative_concept_path(assigns(:employee_remunerative_concept))
  end

  test "should show employee_remunerative_concept" do
    get :show, :id => @employee_remunerative_concept.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @employee_remunerative_concept.to_param
    assert_response :success
  end

  test "should update employee_remunerative_concept" do
    put :update, :id => @employee_remunerative_concept.to_param, :employee_remunerative_concept => @employee_remunerative_concept.attributes
    assert_redirected_to employee_remunerative_concept_path(assigns(:employee_remunerative_concept))
  end

  test "should destroy employee_remunerative_concept" do
    assert_difference('EmployeeRemunerativeConcept.count', -1) do
      delete :destroy, :id => @employee_remunerative_concept.to_param
    end

    assert_redirected_to employee_remunerative_concepts_path
  end
end
