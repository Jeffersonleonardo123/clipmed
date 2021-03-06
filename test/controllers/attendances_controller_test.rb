require 'test_helper'

class AttendancesControllerTest < ActionController::TestCase
  setup do
    @attendance = attendances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance" do
    assert_difference('Attendance.count') do
      post :create, attendance: { acompanhante: @attendance.acompanhante, agreement_id: @attendance.agreement_id, antecedentes: @attendance.antecedentes, client_id: @attendance.client_id, company_id: @attendance.company_id, conduta: @attendance.conduta, date: @attendance.date, diagnostico: @attendance.diagnostico, exame_fisico: @attendance.exame_fisico, habitos: @attendance.habitos, isda: @attendance.isda, professional_id: @attendance.professional_id }
    end

    assert_redirected_to attendance_path(assigns(:attendance))
  end

  test "should show attendance" do
    get :show, id: @attendance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance
    assert_response :success
  end

  test "should update attendance" do
    patch :update, id: @attendance, attendance: { acompanhante: @attendance.acompanhante, agreement_id: @attendance.agreement_id, antecedentes: @attendance.antecedentes, client_id: @attendance.client_id, company_id: @attendance.company_id, conduta: @attendance.conduta, date: @attendance.date, diagnostico: @attendance.diagnostico, exame_fisico: @attendance.exame_fisico, habitos: @attendance.habitos, isda: @attendance.isda, professional_id: @attendance.professional_id }
    assert_redirected_to attendance_path(assigns(:attendance))
  end

  test "should destroy attendance" do
    assert_difference('Attendance.count', -1) do
      delete :destroy, id: @attendance
    end

    assert_redirected_to attendances_path
  end
end
