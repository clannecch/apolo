require 'test_helper'

class EducationalLevelsControllerTest < ActionController::TestCase
  setup do
    @educational_level = educational_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:educational_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create educational_level" do
    assert_difference('EducationalLevel.count') do
      post :create, :educational_level => @educational_level.attributes
    end

    assert_redirected_to educational_level_path(assigns(:educational_level))
  end

  test "should show educational_level" do
    get :show, :id => @educational_level.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @educational_level.to_param
    assert_response :success
  end

  test "should update educational_level" do
    put :update, :id => @educational_level.to_param, :educational_level => @educational_level.attributes
    assert_redirected_to educational_level_path(assigns(:educational_level))
  end

  test "should destroy educational_level" do
    assert_difference('EducationalLevel.count', -1) do
      delete :destroy, :id => @educational_level.to_param
    end

    assert_redirected_to educational_levels_path
  end
end
