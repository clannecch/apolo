require 'test_helper'

class DetalleReciboRetencionsControllerTest < ActionController::TestCase
  setup do
    @detalle_recibo_retencion = detalle_recibo_retencions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_recibo_retencions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_recibo_retencion" do
    assert_difference('DetalleReciboRetencion.count') do
      post :create, :detalle_recibo_retencion => @detalle_recibo_retencion.attributes
    end

    assert_redirected_to detalle_recibo_retencion_path(assigns(:detalle_recibo_retencion))
  end

  test "should show detalle_recibo_retencion" do
    get :show, :id => @detalle_recibo_retencion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @detalle_recibo_retencion.to_param
    assert_response :success
  end

  test "should update detalle_recibo_retencion" do
    put :update, :id => @detalle_recibo_retencion.to_param, :detalle_recibo_retencion => @detalle_recibo_retencion.attributes
    assert_redirected_to detalle_recibo_retencion_path(assigns(:detalle_recibo_retencion))
  end

  test "should destroy detalle_recibo_retencion" do
    assert_difference('DetalleReciboRetencion.count', -1) do
      delete :destroy, :id => @detalle_recibo_retencion.to_param
    end

    assert_redirected_to detalle_recibo_retencions_path
  end
end
