require 'test_helper'

class GroupRemunerationRelationsControllerTest < ActionController::TestCase
  setup do
    @group_remuneration_relation = group_remuneration_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_remuneration_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_remuneration_relation" do
    assert_difference('GroupRemunerationRelation.count') do
      post :create, :group_remuneration_relation => @group_remuneration_relation.attributes
    end

    assert_redirected_to group_remuneration_relation_path(assigns(:group_remuneration_relation))
  end

  test "should show group_remuneration_relation" do
    get :show, :id => @group_remuneration_relation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @group_remuneration_relation.to_param
    assert_response :success
  end

  test "should update group_remuneration_relation" do
    put :update, :id => @group_remuneration_relation.to_param, :group_remuneration_relation => @group_remuneration_relation.attributes
    assert_redirected_to group_remuneration_relation_path(assigns(:group_remuneration_relation))
  end

  test "should destroy group_remuneration_relation" do
    assert_difference('GroupRemunerationRelation.count', -1) do
      delete :destroy, :id => @group_remuneration_relation.to_param
    end

    assert_redirected_to group_remuneration_relations_path
  end
end
