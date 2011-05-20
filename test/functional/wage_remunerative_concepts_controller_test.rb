require 'test_helper'

class WageRemunerativeConceptsControllerTest < ActionController::TestCase
  setup do
    @wage_remunerative_concept = wage_remunerative_concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wage_remunerative_concepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wage_remunerative_concept" do
    assert_difference('RemunerativeConcept.count') do
      post :create, :wage_remunerative_concept => @wage_remunerative_concept.attributes
    end

    assert_redirected_to wage_remunerative_concept_path(assigns(:wage_remunerative_concept))
  end

  test "should show wage_remunerative_concept" do
    get :show, :id => @wage_remunerative_concept.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wage_remunerative_concept.to_param
    assert_response :success
  end

  test "should update wage_remunerative_concept" do
    put :update, :id => @wage_remunerative_concept.to_param, :wage_remunerative_concept => @wage_remunerative_concept.attributes
    assert_redirected_to wage_remunerative_concept_path(assigns(:wage_remunerative_concept))
  end

  test "should destroy wage_remunerative_concept" do
    assert_difference('RemunerativeConcept.count', -1) do
      delete :destroy, :id => @wage_remunerative_concept.to_param
    end

    assert_redirected_to wage_remunerative_concepts_path
  end
end
