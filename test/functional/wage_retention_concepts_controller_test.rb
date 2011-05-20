require 'test_helper'

class WageRetentionConceptsControllerTest < ActionController::TestCase
  setup do
    @wage_retention_concept = wage_retention_concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wage_retention_concepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wage_retention_concept" do
    assert_difference('WageRetentionConcept.count') do
      post :create, :wage_retention_concept => @wage_retention_concept.attributes
    end

    assert_redirected_to wage_retention_concept_path(assigns(:wage_retention_concept))
  end

  test "should show wage_retention_concept" do
    get :show, :id => @wage_retention_concept.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wage_retention_concept.to_param
    assert_response :success
  end

  test "should update wage_retention_concept" do
    put :update, :id => @wage_retention_concept.to_param, :wage_retention_concept => @wage_retention_concept.attributes
    assert_redirected_to wage_retention_concept_path(assigns(:wage_retention_concept))
  end

  test "should destroy wage_retention_concept" do
    assert_difference('WageRetentionConcept.count', -1) do
      delete :destroy, :id => @wage_retention_concept.to_param
    end

    assert_redirected_to wage_retention_concepts_path
  end
end
