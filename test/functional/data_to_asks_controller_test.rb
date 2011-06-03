require 'test_helper'

class DataToAsksControllerTest < ActionController::TestCase
  setup do
    @data_to_ask = data_to_asks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_to_asks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_to_ask" do
    assert_difference('DataToAsk.count') do
      post :create, :data_to_ask => @data_to_ask.attributes
    end

    assert_redirected_to data_to_ask_path(assigns(:data_to_ask))
  end

  test "should show data_to_ask" do
    get :show, :id => @data_to_ask.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @data_to_ask.to_param
    assert_response :success
  end

  test "should update data_to_ask" do
    put :update, :id => @data_to_ask.to_param, :data_to_ask => @data_to_ask.attributes
    assert_redirected_to data_to_ask_path(assigns(:data_to_ask))
  end

  test "should destroy data_to_ask" do
    assert_difference('DataToAsk.count', -1) do
      delete :destroy, :id => @data_to_ask.to_param
    end

    assert_redirected_to data_to_asks_path
  end
end
