require 'test_helper'

class GroupRetentionsControllerTest < ActionController::TestCase
  setup do
    @group_retention = group_retentions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_retentions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_retention" do
    assert_difference('GroupRetention.count') do
      post :create, :group_retention => @group_retention.attributes
    end

    assert_redirected_to group_retention_path(assigns(:group_retention))
  end

  test "should show group_retention" do
    get :show, :id => @group_retention.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @group_retention.to_param
    assert_response :success
  end

  test "should update group_retention" do
    put :update, :id => @group_retention.to_param, :group_retention => @group_retention.attributes
    assert_redirected_to group_retention_path(assigns(:group_retention))
  end

  test "should destroy group_retention" do
    assert_difference('GroupRetention.count', -1) do
      delete :destroy, :id => @group_retention.to_param
    end

    assert_redirected_to group_retentions_path
  end
end
