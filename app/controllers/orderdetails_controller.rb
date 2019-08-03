class OrderdetailsController < ApplicationController
  before_action :check_auth
  def index
    @order = Order.find(params[:order_id])
    @orderdetails = @order.orderdetails
  end
end
