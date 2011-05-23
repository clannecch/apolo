require 'test_helper'

class GroupRemunerationsControllerTest < ActionController::TestCase
  setup do
    @group_remuneration = group_remunerations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_remunerations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_remuneration" do
    assert_difference('GroupRemuneration.count') do
      post :create, :group_remuneration => @group_remuneration.attributes
    end

    assert_redirected_to group_remuneration_path(assigns(:group_remuneration))
  end

  test "should show group_remuneration" do
    get :show, :id => @group_remuneration.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @group_remuneration.to_param
    assert_response :success
  end

  test "should update group_remuneration" do
    put :update, :id => @group_remuneration.to_param, :group_remuneration => @group_remuneration.attributes
    assert_redirected_to group_remuneration_path(assigns(:group_remuneration))
  end

  test "should destroy group_remuneration" do
    assert_difference('GroupRemuneration.count', -1) do
      delete :destroy, :id => @group_remuneration.to_param
    end

    assert_redirected_to group_remunerations_path
  end
end
