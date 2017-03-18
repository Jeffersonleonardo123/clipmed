class SchedullersController < ApplicationController
  before_action :set_scheduller, only: [:show, :edit, :update, :destroy]

  # GET /schedullers
  # GET /schedullers.json
  def index
    @schedullers = current_user.company.schedullers.all
    @agreements            = current_user.company.agreements.all
  	@date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  # GET /schedullers/1
  # GET /schedullers/1.json
  def show
  end

  # GET /schedullers/new
  def new
    # @client = Client.new
    @professionals         = current_user.company.professionals.all
    @agreements            = current_user.company.agreements.all
    @scheduller            = Scheduller.new
    @scheduller.company_id = current_user.company_id
    @scheduller.user_id    = current_user.id
    @scheduller.date       =  DateTime.now.to_date
    @scheduller.status     =  'not_confirmed'
  end

  def alter_scheduller
    @agreements            = current_user.company.agreements.all

    @professionals         = current_user.company.professionals.all
    @scheduller = Scheduller.find(params['scheduller_id'])
  end

  # GET /schedullers/1/edit
  def edit
  end

  def save_scheduller
      if params['id']
        scheduller = Scheduller.find(params['id'])
      else
        scheduller = Scheduller.new
      end
      scheduller.company_id  = current_user.company.id
      scheduller.user_id     = current_user.id
      scheduller.name        = params['client_name']
      scheduller.professional_id = params['professional_id']
      scheduller.date        = params['date']
      scheduller.time_marked = params['time_marked']
      scheduller.time_marked_end = params['time_marked_end']
      scheduller.observation = params['observation']
      scheduller.name        = params['name']
      scheduller.status      = params['status']
      scheduller.celphone    = params['celphone']
      scheduller.phone       = params['phone']
      scheduller.tipo_atendimento = params['tipo_atendimento']
      scheduller.agreement_id = params['agreement_id']

      if(params['client_id'])
        scheduller.client_id   = params['client_id']
      end

      scheduller.save

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
    @agreements     = current_user.company.agreements.all
    @professionals  = current_user.company.professionals.all
    @schedullers = current_user.company.schedullers.all
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
