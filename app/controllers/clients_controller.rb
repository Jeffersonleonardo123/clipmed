class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :get_professionals, only:[:new, :edit, :create, :update ]
  before_filter :authorize_user



  # GET /clients
  # GET /clients.json
  def index
    @clients = current_user.company.clients.where('deleted_at IS NULL');
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.company_id = current_user.company_id
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Paciente salvo com sucesso.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Paciente salvo com sucesso.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_client_logic
      @client = Client.find(params['id'])
      @client.update(deleted_at: Date.today)
      respond_to do |format|
        format.html { redirect_to clients_url, notice: 'Paciente excluido com sucesso.' }
        format.json { head :no_content }
      end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Paciente excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def find_clients
    name = params[:name]
    @client = Client.new
    @clients =   current_user.company.clients.where("name LIKE ? and deleted_at IS NULL", "%#{name}%" )
  end

  def scheduller_day

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :email, :cpf, :celular, :fone, :company_id, :number,
            :address, :zip, :neighborhood, :city, :state, :observation, :situation, :professional_id,:nascimento)
    end

    def get_professionals
        @professionals = current_user.company.professionals
    end

end
