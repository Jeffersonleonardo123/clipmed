class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user


  # GET /agreements
  # GET /agreements.json
  def index
    @agreements = current_user.company.agreements.where('deleted_at IS NULL')
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
    @agreement.company_id = current_user.company_id
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)
    respond_to do |format|
      if @agreement.save
        format.html { redirect_to agreements_path, notice: 'Convênio criado com sucesso.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to agreements_path, notice: 'Convênio alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_agreement_logic
      @agreement = Agreement.find(params['id'])
      @agreement.update(deleted_at: Date.today)
      respond_to do |format|
        format.html { redirect_to agreements_path, notice: 'Convênio excluido com sucesso.' }
        format.json { head :no_content }
      end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url, notice: 'Agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement).permit(:name, :email, :cnpj, :fone, :company_id, :number, :address, :zip, :neighborhood, :city, :state, :observation, :contact, :site)
    end
end
