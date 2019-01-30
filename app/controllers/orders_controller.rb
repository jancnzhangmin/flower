class OrdersController < ApplicationController

  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.paginate(:page => params[:page], :per_page => 15).order('id desc')
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :ordernumber, :deduction, :payprice, :paysum, :paystatus, :province, :city, :district, :street, :address, :contact, :contactphone, :receiptstatus, :autoreceipttime, :commentstatus, :summary, :adcode, :status, :paytime, :owerprofit, :discount, :deliverstatus)
  end

end
