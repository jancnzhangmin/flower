class OrderdetailsController < ApplicationController
  def index
    @order = Order.find(params[:order_id])
    @orderdetails = @order.orderdetails
  end
end
