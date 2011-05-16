require 'test_helper'

class GroupRenumberingsControllerTest < ActionController::TestCase
  setup do
    @group_renumbering = group_renumberings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_renumberings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_renumbering" do
    assert_difference('GroupRenumbering.count') do
      post :create, :group_renumbering => @group_renumbering.attributes
    end

    assert_redirected_to group_renumbering_path(assigns(:group_renumbering))
  end

  test "should show group_renumbering" do
    get :show, :id => @group_renumbering.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @group_renumbering.to_param
    assert_response :success
  end

  test "should update group_renumbering" do
    put :update, :id => @group_renumbering.to_param, :group_renumbering => @group_renumbering.attributes
    assert_redirected_to group_renumbering_path(assigns(:group_renumbering))
  end

  test "should destroy group_renumbering" do
    assert_difference('GroupRenumbering.count', -1) do
      delete :destroy, :id => @group_renumbering.to_param
    end

    assert_redirected_to group_renumberings_path
  end
end
