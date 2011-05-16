require 'test_helper'

class IssuedsControllerTest < ActionController::TestCase
  setup do
    @issued = issueds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issueds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issued" do
    assert_difference('Issued.count') do
      post :create, :issued => @issued.attributes
    end

    assert_redirected_to issued_path(assigns(:issued))
  end

  test "should show issued" do
    get :show, :id => @issued.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @issued.to_param
    assert_response :success
  end

  test "should update issued" do
    put :update, :id => @issued.to_param, :issued => @issued.attributes
    assert_redirected_to issued_path(assigns(:issued))
  end

  test "should destroy issued" do
    assert_difference('Issued.count', -1) do
      delete :destroy, :id => @issued.to_param
    end

    assert_redirected_to issueds_path
  end
end
