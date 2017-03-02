require 'test_helper'

class SchedullersControllerTest < ActionController::TestCase
  setup do
    @scheduller = schedullers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedullers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheduller" do
    assert_difference('Scheduller.count') do
      post :create, scheduller: { : @scheduller., : @scheduller., : @scheduller., client_id: @scheduller.client_id, company_id: @scheduller.company_id, date: @scheduller.date, observation: @scheduller.observation, professional_id: @scheduller.professional_id, time: @scheduller.time, user_id: @scheduller.user_id }
    end

    assert_redirected_to scheduller_path(assigns(:scheduller))
  end

  test "should show scheduller" do
    get :show, id: @scheduller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scheduller
    assert_response :success
  end

  test "should update scheduller" do
    patch :update, id: @scheduller, scheduller: { : @scheduller., : @scheduller., : @scheduller., client_id: @scheduller.client_id, company_id: @scheduller.company_id, date: @scheduller.date, observation: @scheduller.observation, professional_id: @scheduller.professional_id, time: @scheduller.time, user_id: @scheduller.user_id }
    assert_redirected_to scheduller_path(assigns(:scheduller))
  end

  test "should destroy scheduller" do
    assert_difference('Scheduller.count', -1) do
      delete :destroy, id: @scheduller
    end

    assert_redirected_to schedullers_path
  end
end
