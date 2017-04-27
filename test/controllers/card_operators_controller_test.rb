require 'test_helper'

class CardOperatorsControllerTest < ActionController::TestCase
  setup do
    @card_operator = card_operators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_operators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_operator" do
    assert_difference('CardOperator.count') do
      post :create, card_operator: { company_id: @card_operator.company_id, deleted_at: @card_operator.deleted_at, name: @card_operator.name }
    end

    assert_redirected_to card_operator_path(assigns(:card_operator))
  end

  test "should show card_operator" do
    get :show, id: @card_operator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_operator
    assert_response :success
  end

  test "should update card_operator" do
    patch :update, id: @card_operator, card_operator: { company_id: @card_operator.company_id, deleted_at: @card_operator.deleted_at, name: @card_operator.name }
    assert_redirected_to card_operator_path(assigns(:card_operator))
  end

  test "should destroy card_operator" do
    assert_difference('CardOperator.count', -1) do
      delete :destroy, id: @card_operator
    end

    assert_redirected_to card_operators_path
  end
end
