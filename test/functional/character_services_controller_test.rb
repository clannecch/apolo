require 'test_helper'

class CharacterServicesControllerTest < ActionController::TestCase
  setup do
    @character_service = character_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_service" do
    assert_difference('CharacterService.count') do
      post :create, :character_service => @character_service.attributes
    end

    assert_redirected_to character_service_path(assigns(:character_service))
  end

  test "should show character_service" do
    get :show, :id => @character_service.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @character_service.to_param
    assert_response :success
  end

  test "should update character_service" do
    put :update, :id => @character_service.to_param, :character_service => @character_service.attributes
    assert_redirected_to character_service_path(assigns(:character_service))
  end

  test "should destroy character_service" do
    assert_difference('CharacterService.count', -1) do
      delete :destroy, :id => @character_service.to_param
    end

    assert_redirected_to character_services_path
  end
end
