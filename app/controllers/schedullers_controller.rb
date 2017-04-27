class SchedullersController < ApplicationController
  before_action :set_scheduller, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user


  # GET /schedullers
  # GET /schedullers.json
  def index
    @schedullers = current_user.company.schedullers
    @agreements  = current_user.company.agreements
  	@date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  # GET /schedullers/1
  # GET /schedullers/1.json
  def show
  end

  # GET /schedullers/new
  def new
    # @client = Client.new
    @professionals         = current_user.company.professionals
    @agreements            = current_user.company.agreements
    @scheduller            = Scheduller.new
    @scheduller.company_id = current_user.company_id
    @scheduller.user_id    = current_user.id
    @scheduller.date       =  DateTime.now.to_date
    @scheduller.status     =  'not_confirmed'
  end

  def alter_scheduller
    @agreements            = current_user.company.agreements
    @professionals         = current_user.company.professionals
    @scheduller = Scheduller.find(params['scheduller_id'])
  end

  # GET /schedullers/1/edit
  def edit
  end

  def save_scheduller
      scheduller_service = SchedullerService.new
      scheduller_service.set_scheduller(current_user,params)

      @schedullers = current_user.company.schedullers.order(:time_marked).
      where("date = ? and professional_id = ?",params[:date].to_date,params[:professional_id]) ;

      @schedullers_month = current_user.company.schedullers.order(:time_marked).
      where("professional_id = ?",params[:professional_id]) ;

      @date = params[:month] ? Date.parse(params[:month]) : params[:date].to_date
      render "scheduller_filter_day"
  end

  # POST /schedullers
  # POST /schedullers.json
  def create
    @scheduller = Scheduller.new(scheduller_params)
    if params['client_id'] != ''
      @scheduller.client_id = params['client_id']
    end
    respond_to do |format|
      if @scheduller.save
        format.html { redirect_to scheduller_day_path, notice: 'Scheduller was successfully created.' }
        format.json { render :show, status: :created, location: @scheduller }
      else
        format.html { render :new }
        format.json { render json: @scheduller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedullers/1
  # PATCH/PUT /schedullers/1.json
  def update
    if (params['client_id'])
      @scheduller.client_id = params['client_id']
    end

    respond_to do |format|
      if @scheduller.update(scheduller_params)
        format.html { redirect_to scheduller_day_path, notice: 'Scheduller was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduller }
      else
        format.html { render :edit }
        format.json { render json: @scheduller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedullers/1
  # DELETE /schedullers/1.json
  def destroy
    @scheduller.destroy
    respond_to do |format|
      format.html { redirect_to scheduller_day_path, notice: 'Scheduller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm_client
     @client = Client.find(params[:client_id])
  end


  def scheduller_day
    @agreements     = current_user.company.agreements
    @professionals  = current_user.company.professionals
    @schedullers = current_user.company.schedullers
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def scheduller_filter_day
      @date = params[:month] ? Date.parse(params[:month]) : params[:date_find].to_date

      @schedullers = current_user.company.schedullers.order(:time_marked).
      where("date = ? and professional_id = ?",params[:date_find].to_date,params[:professional_id]) ;

      @schedullers_month = current_user.company.schedullers.order(:time_marked).
      where("professional_id = ?",params[:professional_id]) ;

      @professional_id = params[:professional_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduller
      @scheduller = Scheduller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduller_params
      params.require(:scheduller).permit(:company_id, :user_id, :client_id, :professional_id,:agreement_id,
                                         :date,  :time_marked, :observation, :name, :time_marked_end,
                                         :status, :celphone, :phone, :tipo_atendimento)
    end
    end
