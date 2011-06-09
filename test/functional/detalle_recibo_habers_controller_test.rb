require 'test_helper'

class DetalleReciboHabersControllerTest < ActionController::TestCase
  setup do
    @detalle_recibo_haber = detalle_recibo_habers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_recibo_habers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_recibo_haber" do
    assert_difference('DetalleReciboHaber.count') do
      post :create, :detalle_recibo_haber => @detalle_recibo_haber.attributes
    end

    assert_redirected_to detalle_recibo_haber_path(assigns(:detalle_recibo_haber))
  end

  test "should show detalle_recibo_haber" do
    get :show, :id => @detalle_recibo_haber.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @detalle_recibo_haber.to_param
    assert_response :success
  end

  test "should update detalle_recibo_haber" do
    put :update, :id => @detalle_recibo_haber.to_param, :detalle_recibo_haber => @detalle_recibo_haber.attributes
    assert_redirected_to detalle_recibo_haber_path(assigns(:detalle_recibo_haber))
  end

  test "should destroy detalle_recibo_haber" do
    assert_difference('DetalleReciboHaber.count', -1) do
      delete :destroy, :id => @detalle_recibo_haber.to_param
    end

    assert_redirected_to detalle_recibo_habers_path
  end
end
