require 'test_helper'

class HomeAboutsControllerTest < ActionController::TestCase
  setup do
    @home_about = home_abouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_abouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_about" do
    assert_difference('HomeAbout.count') do
      post :create, :home_about => @home_about.attributes
    end

    assert_redirected_to home_about_path(assigns(:home_about))
  end

  test "should show home_about" do
    get :show, :id => @home_about.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @home_about.to_param
    assert_response :success
  end

  test "should update home_about" do
    put :update, :id => @home_about.to_param, :home_about => @home_about.attributes
    assert_redirected_to home_about_path(assigns(:home_about))
  end

  test "should destroy home_about" do
    assert_difference('HomeAbout.count', -1) do
      delete :destroy, :id => @home_about.to_param
    end

    assert_redirected_to home_abouts_path
  end
end
