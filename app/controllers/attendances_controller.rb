class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user


  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = current_user.company.attendances
    @agreements  = current_user.company.agreements
    @professionals  = current_user.company.professionals
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @professionals = current_user.company.professionals
    @scheduller = Scheduller.find(params['scheduller_id'])
    @client = Client.find(@scheduller.client_id)

    @first_attendance = current_user.company.attendances.order(:updated_at).
                        where("client_id = ? and professional_id = ?",@scheduller.client_id, @scheduller.professional_id).first ;

    if not @first_attendance
      @first_attendance = current_user.company.attendances.order(:updated_at).
                          where("client_id = ? ",@scheduller.client_id).first ;
    end

    @history_list = current_user.company.attendances.order(:updated_at).
                        where("client_id = ? ",@scheduller.client_id);

    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
    @professionals = current_user.company.professionals
    @scheduller = Scheduller.find(params['scheduller_id'])
    @client = Client.find(@scheduller.client_id)
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.status = "ATENDIDO"
    @attendance.date = Date.today

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendance_day_path, notice: 'Atendimento foi salvo com sucesso!' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendance_day_path, notice: 'Atendimento foi salvo com sucesso!' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def attendance_day
    @professionals  = current_user.company.professionals
    @schedullers = current_user.company.schedullers.order(:time_marked).
    where("date = ? ",Date.today) ;
  end

  def attendance_filter_day
    @schedullers = current_user.company.schedullers.order(:time_marked).
    where("date = ? and professional_id = ?",params[:date_find].to_date,params[:professional_id]) ;
  end


  def filter_attendance
    @attendances = current_user.company.attendances
    if params['agreement_id']
      @attendances = @attendances.where('agreement_id = ?', params['agreement_id'])
    end
    if params['professional_id']
      @attendances = @attendances.where('professional_id = ?', params['professional_id'])
    end
    if params['client_id'].to_i > 0
      @attendances = @attendances.where('client_id = ?', params['client_id'])
    end
    if params['date_begin'] != ''
      @attendances = @attendances.where('date >= ?', params['date_begin'].to_date)
    end
    if params['date_end'] != ''
      @attendances = @attendances.where('date <= ?', params['date_end'].to_date)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:company_id, :professional_id, :client_id, :agreement_id, :date, :acompanhante,
                                         :antecedentes, :habitos, :isda, :exame_fisico, :diagnostico, :conduta, :hma,
                                         :time_begin,:time_end,:tipo_atendimento,:medicamentos,:outras_informacoes)
    end
end
