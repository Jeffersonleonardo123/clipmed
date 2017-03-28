class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user


  # GET /professionals
  # GET /professionals.json
  def index
    @professionals = current_user.company.professionals.where('deleted_at IS NULL')
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
  end

  # GET /professionals/new
  def new
    @professional = Professional.new
    @professional.company_id = current_user.company_id
  end

  # GET /professionals/1/edit
  def edit
  end

  # POST /professionals
  # POST /professionals.json
  def create
    @professional = Professional.new(professional_params)

    respond_to do |format|
      if @professional.save
        format.html { redirect_to professionals_path, notice: 'Médico salvo com sucesso.' }
        format.json { render :show, status: :created, location: @professional }
      else
        format.html { render :new }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professionals/1
  # PATCH/PUT /professionals/1.json
  def update
    respond_to do |format|
      if @professional.update(professional_params)
        format.html { redirect_to professionals_path, notice: 'Médico alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @professional }
      else
        format.html { render :edit }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_professional_logic
      @professional = Professional.find(params['id'])
      @professional.update(deleted_at: Date.today)
      respond_to do |format|
        format.html { redirect_to professionals_path, notice: 'Médico excluido com sucesso.' }
        format.json { head :no_content }
      end
  end


  # DELETE /professionals/1
  # DELETE /professionals/1.json
  def destroy
    @professional.destroy
    respond_to do |format|
      format.html { redirect_to professionals_url, notice: 'Professional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional
      @professional = Professional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_params
      params.require(:professional).permit(:name, :email, :cpf, :celular, :fone, :company_id, :number, :address, :zip, :neighborhood, :city, :state, :observation, :situation, :function)
    end
end
