require 'test_helper'

class RemunerationTypesControllerTest < ActionController::TestCase
  setup do
    @remuneration_type = remuneration_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remuneration_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remuneration_type" do
    assert_difference('RemunerationType.count') do
      post :create, :remuneration_type => @remuneration_type.attributes
    end

    assert_redirected_to remuneration_type_path(assigns(:remuneration_type))
  end

  test "should show remuneration_type" do
    get :show, :id => @remuneration_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @remuneration_type.to_param
    assert_response :success
  end

  test "should update remuneration_type" do
    put :update, :id => @remuneration_type.to_param, :remuneration_type => @remuneration_type.attributes
    assert_redirected_to remuneration_type_path(assigns(:remuneration_type))
  end

  test "should destroy remuneration_type" do
    assert_difference('RemunerationType.count', -1) do
      delete :destroy, :id => @remuneration_type.to_param
    end

    assert_redirected_to remuneration_types_path
  end
end
