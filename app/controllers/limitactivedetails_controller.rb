class LimitactivedetailsController < ApplicationController
  before_action :check_auth
  def index
    @limitactive = Limitactive.find(params[:limitactive_id])
    @activedetails = @limitactive.limitactivedetails
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def newproduct
    @limitactive = Limitactive.find(params[:limitactive_id])
    @limitactivedetail = @limitactive.limitactivedetails.new
  end

  def edit
    @limitactive = Limitactive.find(params[:limitactive_id])
    @limitactivedetail = Limitactivedetail.find(params[:id])
    @product = Product.find(@limitactivedetail.product_id)
  end

  def update
    @limitactive = Limitactive.find(params[:limitactive_id])
    @limitactivedetail = Limitactivedetail.find(params[:id])
    @limitactivedetail.update(limitactivedetail_params)
    redirect_to limitactive_limitactivedetails_path(@limitactive)
  end

  def create
    @limitactive = Limitactive.find(params[:limitactive_id])
    @limitactive.limitactivedetails.create(limitactivedetail_params)
    redirect_to limitactive_limitactivedetails_path(@limitactive)
  end

  def destroy
    @limitactive = Limitactive.find(params[:limitactive_id])
    @limitactivedetail = Limitactivedetail.find(params[:id])
    @limitactivedetail.destroy
    redirect_to limitactive_limitactivedetails_path(@limitactive)
  end

  private
  def limitactivedetail_params
    params.require(:limitactivedetail).permit(:product_id, :price, :minnumber, :limitnumber, :disableprofit, :profitpercent, :disableowerprofit, :owerprofitpencent)
  end

end
