class CardOperatorsController < ApplicationController
  before_action :set_card_operator, only: [:show, :edit, :update, :destroy]

  # GET /card_operators
  # GET /card_operators.json
  def index
    @card_operators =  current_user.company.card_operators.where('deleted_at IS NULL')
  end

  # GET /card_operators/1
  # GET /card_operators/1.json
  def show
  end

  # GET /card_operators/new
  def new
    @card_operator = CardOperator.new
    @card_operator.company_id = current_user.company_id
  end

  # GET /card_operators/1/edit
  def edit
  end

  # POST /card_operators
  # POST /card_operators.json
  def create
    @card_operator = CardOperator.new(card_operator_params)

    respond_to do |format|
      if @card_operator.save
        format.html { redirect_to card_operators_path, notice: 'Operadora de cartão salva com sucesso.' }
        format.json { render :show, status: :created, location: @card_operator }
      else
        format.html { render :new }
        format.json { render json: @card_operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_operators/1
  # PATCH/PUT /card_operators/1.json
  def update
    respond_to do |format|
      if @card_operator.update(card_operator_params)
        format.html { redirect_to card_operators_path, notice: 'Operadora de cartão alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @card_operator }
      else
        format.html { render :edit }
        format.json { render json: @card_operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_operators/1
  # DELETE /card_operators/1.json
  def destroy
    @card_operator.destroy
    respond_to do |format|
      format.html { redirect_to card_operators_url, notice: 'Card operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_card_operator_logic
      @card_operator = CardOperator.find(params['id'])
      @card_operator.update(deleted_at: Date.today)
      respond_to do |format|
        format.html { redirect_to card_operators_path, notice: 'Operadora excluida com sucesso.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_operator
      @card_operator = CardOperator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_operator_params
      params.require(:card_operator).permit(:company_id, :deleted_at, :name, :id)
    end
end
