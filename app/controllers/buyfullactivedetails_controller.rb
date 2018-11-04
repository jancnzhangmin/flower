class BuyfullactivedetailsController < ApplicationController
  def index
    @buyfullactive = Buyfullactive.find(params[:buyfullactive_id])
    @activedetails = @buyfullactive.buyfullactivedetails
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def newproduct
    @buyfullactive = Buyfullactive.find(params[:buyfullactive_id])
    @buyfullactivedetail = @buyfullactive.buyfullactivedetails.new
  end

  def edit
    @buyfullactive = Buyfullactive.find(params[:buyfullactive_id])
    @buyfullactivedetail = Buyfullactivedetail.find(params[:id])
    @product = Product.find(@buyfullactivedetail.product_id)
  end

  def update
    @buyfullactive = Buyfullactive.find(params[:buyfullactive_id])
    @buyfullactivedetail = Buyfullactivedetail.find(params[:id])
    @buyfullactivedetail.update(buyfullactivedetail_params)
    redirect_to buyfullactive_buyfullactivedetails_path(@buyfullactive)
  end

  def create
    @buyfullactive = Buyfullactive.find(params[:buyfullactive_id])
    @buyfullactive.buyfullactivedetails.create(buyfullactivedetail_params)
    redirect_to buyfullactive_buyfullactivedetails_path(@buyfullactive)
  end

  def destroy
    @buyfullactive = Buyfullactive.find(params[:buyfullactive_id])
    @buyfullactivedetail = Buyfullactivedetail.find(params[:id])
    @buyfullactivedetail.destroy
    redirect_to buyfullactive_buyfullactivedetails_path(@buyfullactive)
  end

  private
  def buyfullactivedetail_params
    params.require(:buyfullactivedetail).permit(:product_id, :number, :giveproduct_id, :givenumber, :disableprofit, :profitpercent, :disableowerprofit, :owerprofitpercent, :intocost)
  end
end
