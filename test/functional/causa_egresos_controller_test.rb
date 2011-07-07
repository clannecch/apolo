require 'test_helper'

class CausaEgresosControllerTest < ActionController::TestCase
  setup do
    @causa_egreso = causa_egresos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:causa_egresos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create causa_egreso" do
    assert_difference('CausaEgreso.count') do
      post :create, :causa_egreso => @causa_egreso.attributes
    end

    assert_redirected_to causa_egreso_path(assigns(:causa_egreso))
  end

  test "should show causa_egreso" do
    get :show, :id => @causa_egreso.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @causa_egreso.to_param
    assert_response :success
  end

  test "should update causa_egreso" do
    put :update, :id => @causa_egreso.to_param, :causa_egreso => @causa_egreso.attributes
    assert_redirected_to causa_egreso_path(assigns(:causa_egreso))
  end

  test "should destroy causa_egreso" do
    assert_difference('CausaEgreso.count', -1) do
      delete :destroy, :id => @causa_egreso.to_param
    end

    assert_redirected_to causa_egresos_path
  end
end
