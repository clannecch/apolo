require 'test_helper'

class TipoRecibosControllerTest < ActionController::TestCase
  setup do
    @tipo_recibo = tipo_recibos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_recibos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_recibo" do
    assert_difference('TipoRecibo.count') do
      post :create, :tipo_recibo => @tipo_recibo.attributes
    end

    assert_redirected_to tipo_recibo_path(assigns(:tipo_recibo))
  end

  test "should show tipo_recibo" do
    get :show, :id => @tipo_recibo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_recibo.to_param
    assert_response :success
  end

  test "should update tipo_recibo" do
    put :update, :id => @tipo_recibo.to_param, :tipo_recibo => @tipo_recibo.attributes
    assert_redirected_to tipo_recibo_path(assigns(:tipo_recibo))
  end

  test "should destroy tipo_recibo" do
    assert_difference('TipoRecibo.count', -1) do
      delete :destroy, :id => @tipo_recibo.to_param
    end

    assert_redirected_to tipo_recibos_path
  end
end
