require 'test_helper'

class RemunerativeConceptsControllerTest < ActionController::TestCase
  setup do
    @remunerative_concept = remunerative_concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remunerative_concepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remunerative_concept" do
    assert_difference('RemunerativeConcept.count') do
      post :create, :remunerative_concept => @remunerative_concept.attributes
    end

    assert_redirected_to remunerative_concept_path(assigns(:remunerative_concept))
  end

  test "should show remunerative_concept" do
    get :show, :id => @remunerative_concept.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @remunerative_concept.to_param
    assert_response :success
  end

  test "should update remunerative_concept" do
    put :update, :id => @remunerative_concept.to_param, :remunerative_concept => @remunerative_concept.attributes
    assert_redirected_to remunerative_concept_path(assigns(:remunerative_concept))
  end

  test "should destroy remunerative_concept" do
    assert_difference('RemunerativeConcept.count', -1) do
      delete :destroy, :id => @remunerative_concept.to_param
    end

    assert_redirected_to remunerative_concepts_path
  end
end
