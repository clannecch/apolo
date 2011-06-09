require 'test_helper'

class ReciboSueldosControllerTest < ActionController::TestCase
  setup do
    @recibo_sueldo = recibo_sueldos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recibo_sueldos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recibo_sueldo" do
    assert_difference('ReciboSueldo.count') do
      post :create, :recibo_sueldo => @recibo_sueldo.attributes
    end

    assert_redirected_to recibo_sueldo_path(assigns(:recibo_sueldo))
  end

  test "should show recibo_sueldo" do
    get :show, :id => @recibo_sueldo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @recibo_sueldo.to_param
    assert_response :success
  end

  test "should update recibo_sueldo" do
    put :update, :id => @recibo_sueldo.to_param, :recibo_sueldo => @recibo_sueldo.attributes
    assert_redirected_to recibo_sueldo_path(assigns(:recibo_sueldo))
  end

  test "should destroy recibo_sueldo" do
    assert_difference('ReciboSueldo.count', -1) do
      delete :destroy, :id => @recibo_sueldo.to_param
    end

    assert_redirected_to recibo_sueldos_path
  end
end
