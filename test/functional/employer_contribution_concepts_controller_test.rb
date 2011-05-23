require 'test_helper'

class EmployerContributionConceptsControllerTest < ActionController::TestCase
  setup do
    @employer_contribution_concept = employer_contribution_concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employer_contribution_concepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employer_contribution_concept" do
    assert_difference('EmployerContributionConcept.count') do
      post :create, :employer_contribution_concept => @employer_contribution_concept.attributes
    end

    assert_redirected_to employer_contribution_concept_path(assigns(:employer_contribution_concept))
  end

  test "should show employer_contribution_concept" do
    get :show, :id => @employer_contribution_concept.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @employer_contribution_concept.to_param
    assert_response :success
  end

  test "should update employer_contribution_concept" do
    put :update, :id => @employer_contribution_concept.to_param, :employer_contribution_concept => @employer_contribution_concept.attributes
    assert_redirected_to employer_contribution_concept_path(assigns(:employer_contribution_concept))
  end

  test "should destroy employer_contribution_concept" do
    assert_difference('EmployerContributionConcept.count', -1) do
      delete :destroy, :id => @employer_contribution_concept.to_param
    end

    assert_redirected_to employer_contribution_concepts_path
  end
end
