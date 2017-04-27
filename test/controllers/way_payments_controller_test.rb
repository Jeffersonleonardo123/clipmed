require 'test_helper'

class WayPaymentsControllerTest < ActionController::TestCase
  setup do
    @way_payment = way_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:way_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create way_payment" do
    assert_difference('WayPayment.count') do
      post :create, way_payment: { company_id: @way_payment.company_id, deleted_at: @way_payment.deleted_at, name: @way_payment.name }
    end

    assert_redirected_to way_payment_path(assigns(:way_payment))
  end

  test "should show way_payment" do
    get :show, id: @way_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @way_payment
    assert_response :success
  end

  test "should update way_payment" do
    patch :update, id: @way_payment, way_payment: { company_id: @way_payment.company_id, deleted_at: @way_payment.deleted_at, name: @way_payment.name }
    assert_redirected_to way_payment_path(assigns(:way_payment))
  end

  test "should destroy way_payment" do
    assert_difference('WayPayment.count', -1) do
      delete :destroy, id: @way_payment
    end

    assert_redirected_to way_payments_path
  end
end
