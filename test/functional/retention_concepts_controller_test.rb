require 'test_helper'

class RetentionConceptsControllerTest < ActionController::TestCase
  setup do
    @retention_concept = retention_concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retention_concepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retention_concept" do
    assert_difference('RetentionConcept.count') do
      post :create, :retention_concept => @retention_concept.attributes
    end

    assert_redirected_to retention_concept_path(assigns(:retention_concept))
  end

  test "should show retention_concept" do
    get :show, :id => @retention_concept.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @retention_concept.to_param
    assert_response :success
  end

  test "should update retention_concept" do
    put :update, :id => @retention_concept.to_param, :retention_concept => @retention_concept.attributes
    assert_redirected_to retention_concept_path(assigns(:retention_concept))
  end

  test "should destroy retention_concept" do
    assert_difference('RetentionConcept.count', -1) do
      delete :destroy, :id => @retention_concept.to_param
    end

    assert_redirected_to retention_concepts_path
  end
end
