class WayPaymentsController < ApplicationController
  before_action :set_way_payment, only: [:show, :edit, :update, :destroy]

  # GET /way_payments
  # GET /way_payments.json
  def index
    @way_payments = WayPayment.all
  end

  # GET /way_payments/1
  # GET /way_payments/1.json
  def show
  end

  # GET /way_payments/new
  def new
    @way_payment = WayPayment.new
  end

  # GET /way_payments/1/edit
  def edit
  end

  # POST /way_payments
  # POST /way_payments.json
  def create
    @way_payment = WayPayment.new(way_payment_params)

    respond_to do |format|
      if @way_payment.save
        format.html { redirect_to @way_payment, notice: 'Way payment was successfully created.' }
        format.json { render :show, status: :created, location: @way_payment }
      else
        format.html { render :new }
        format.json { render json: @way_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /way_payments/1
  # PATCH/PUT /way_payments/1.json
  def update
    respond_to do |format|
      if @way_payment.update(way_payment_params)
        format.html { redirect_to @way_payment, notice: 'Way payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @way_payment }
      else
        format.html { render :edit }
        format.json { render json: @way_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /way_payments/1
  # DELETE /way_payments/1.json
  def destroy
    @way_payment.destroy
    respond_to do |format|
      format.html { redirect_to way_payments_url, notice: 'Way payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_way_payment
      @way_payment = WayPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def way_payment_params
      params.require(:way_payment).permit(:company_id, :deleted_at, :name)
    end
end
