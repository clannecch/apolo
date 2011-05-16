require 'test_helper'

class ProvincesControllerTest < ActionController::TestCase
  setup do
    @province = provinces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provinces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create province" do
    assert_difference('Province.count') do
      post :create, :province => @province.attributes
    end

    assert_redirected_to province_path(assigns(:province))
  end

  test "should show province" do
    get :show, :id => @province.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @province.to_param
    assert_response :success
  end

  test "should update province" do
    put :update, :id => @province.to_param, :province => @province.attributes
    assert_redirected_to province_path(assigns(:province))
  end

  test "should destroy province" do
    assert_difference('Province.count', -1) do
      delete :destroy, :id => @province.to_param
    end

    assert_redirected_to provinces_path
  end
end
