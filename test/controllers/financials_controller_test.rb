require 'test_helper'

class FinancialsControllerTest < ActionController::TestCase
  setup do
    @financial = financials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:financials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create financial" do
    assert_difference('Financial.count') do
      post :create, financial: { addition: @financial.addition, category: @financial.category, client_id: @financial.client_id, company_id: @financial.company_id, conditions_payments: @financial.conditions_payments, date_receiopt: @financial.date_receiopt, date_vencto: @financial.date_vencto, discount: @financial.discount, interest: @financial.interest, parcel: @financial.parcel, reference: @financial.reference, status: @financial.status, user_id: @financial.user_id, value_document: @financial.value_document, value_ticket: @financial.value_ticket, way_payments_id: @financial.way_payments_id }
    end

    assert_redirected_to financial_path(assigns(:financial))
  end

  test "should show financial" do
    get :show, id: @financial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @financial
    assert_response :success
  end

  test "should update financial" do
    patch :update, id: @financial, financial: { addition: @financial.addition, category: @financial.category, client_id: @financial.client_id, company_id: @financial.company_id, conditions_payments: @financial.conditions_payments, date_receiopt: @financial.date_receiopt, date_vencto: @financial.date_vencto, discount: @financial.discount, interest: @financial.interest, parcel: @financial.parcel, reference: @financial.reference, status: @financial.status, user_id: @financial.user_id, value_document: @financial.value_document, value_ticket: @financial.value_ticket, way_payments_id: @financial.way_payments_id }
    assert_redirected_to financial_path(assigns(:financial))
  end

  test "should destroy financial" do
    assert_difference('Financial.count', -1) do
      delete :destroy, id: @financial
    end

    assert_redirected_to financials_path
  end
end
