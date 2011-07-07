require 'test_helper'

class DeduccionGananciasTablesControllerTest < ActionController::TestCase
  setup do
    @deduccion_ganancias_table = deduccion_ganancias_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deduccion_ganancias_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deduccion_ganancias_table" do
    assert_difference('DeduccionGananciasTable.count') do
      post :create, :deduccion_ganancias_table => @deduccion_ganancias_table.attributes
    end

    assert_redirected_to deduccion_ganancias_table_path(assigns(:deduccion_ganancias_table))
  end

  test "should show deduccion_ganancias_table" do
    get :show, :id => @deduccion_ganancias_table.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deduccion_ganancias_table.to_param
    assert_response :success
  end

  test "should update deduccion_ganancias_table" do
    put :update, :id => @deduccion_ganancias_table.to_param, :deduccion_ganancias_table => @deduccion_ganancias_table.attributes
    assert_redirected_to deduccion_ganancias_table_path(assigns(:deduccion_ganancias_table))
  end

  test "should destroy deduccion_ganancias_table" do
    assert_difference('DeduccionGananciasTable.count', -1) do
      delete :destroy, :id => @deduccion_ganancias_table.to_param
    end

    assert_redirected_to deduccion_ganancias_tables_path
  end
end
