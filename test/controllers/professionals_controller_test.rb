require 'test_helper'

class ProfessionalsControllerTest < ActionController::TestCase
  setup do
    @professional = professionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professional" do
    assert_difference('Professional.count') do
      post :create, professional: { address: @professional.address, celular: @professional.celular, city: @professional.city, company_id: @professional.company_id, cpf: @professional.cpf, email: @professional.email, fone: @professional.fone, function: @professional.function, name: @professional.name, neighborhood: @professional.neighborhood, number: @professional.number, observation: @professional.observation, situation: @professional.situation, state: @professional.state, zip: @professional.zip }
    end

    assert_redirected_to professional_path(assigns(:professional))
  end

  test "should show professional" do
    get :show, id: @professional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professional
    assert_response :success
  end

  test "should update professional" do
    patch :update, id: @professional, professional: { address: @professional.address, celular: @professional.celular, city: @professional.city, company_id: @professional.company_id, cpf: @professional.cpf, email: @professional.email, fone: @professional.fone, function: @professional.function, name: @professional.name, neighborhood: @professional.neighborhood, number: @professional.number, observation: @professional.observation, situation: @professional.situation, state: @professional.state, zip: @professional.zip }
    assert_redirected_to professional_path(assigns(:professional))
  end

  test "should destroy professional" do
    assert_difference('Professional.count', -1) do
      delete :destroy, id: @professional
    end

    assert_redirected_to professionals_path
  end
end
