require 'test_helper'

class GroupEmployerContributionsControllerTest < ActionController::TestCase
  setup do
    @group_employer_contribution = group_employer_contributions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_employer_contributions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_employer_contribution" do
    assert_difference('GroupEmployerContribution.count') do
      post :create, :group_employer_contribution => @group_employer_contribution.attributes
    end

    assert_redirected_to group_employer_contribution_path(assigns(:group_employer_contribution))
  end

  test "should show group_employer_contribution" do
    get :show, :id => @group_employer_contribution.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @group_employer_contribution.to_param
    assert_response :success
  end

  test "should update group_employer_contribution" do
    put :update, :id => @group_employer_contribution.to_param, :group_employer_contribution => @group_employer_contribution.attributes
    assert_redirected_to group_employer_contribution_path(assigns(:group_employer_contribution))
  end

  test "should destroy group_employer_contribution" do
    assert_difference('GroupEmployerContribution.count', -1) do
      delete :destroy, :id => @group_employer_contribution.to_param
    end

    assert_redirected_to group_employer_contributions_path
  end
end
