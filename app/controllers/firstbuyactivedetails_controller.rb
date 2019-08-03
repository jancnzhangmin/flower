class FirstbuyactivedetailsController < ApplicationController
  before_action :check_auth
  def index
    @firstbuyactive = Firstbuyactive.find(params[:firstbuyactive_id])
    @activedetails = @firstbuyactive.firstbuyactivedetails
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def new
    @firstbuyactive = Firstbuyactive.find(params[:firstbuyactive_id])
  end

  def newproduct
    @firstbuyactive = Firstbuyactive.find(params[:firstbuyactive_id])
    @firstbuyactivedetail = @firstbuyactive.firstbuyactivedetails.new
  end

  def editproduct
    @firstbuyactive = Firstbuyactive.find(params[:firstbuyactive_id])
    @firstbuyactivedetail = Firstbuyactivedetail.find(params[:id])
    @product = Product.find(@firstbuyactivedetail.product_id)
  end

  def create
    @firstbuyactive = Firstbuyactive.find(params[:firstbuyactive_id])
    @firstbuyactive.firstbuyactivedetails.create(firstbuyactivedetail_params)
    redirect_to firstbuyactive_firstbuyactivedetails_path(@firstbuyactive)
  end

  def update
    @firstbuyactive = Firstbuyactive.find(params[:firstbuyactive_id])
    @firstbuyactivedetail = Firstbuyactivedetail.find(params[:id])
    @firstbuyactivedetail.update(firstbuyactivedetail_params)
    redirect_to firstbuyactive_firstbuyactivedetails_path(@firstbuyactive)
  end

  def destroy
    @firstbuyactive = Firstbuyactive.find(params[:firstbuyactive_id])
    @firstbuyactivedetail = Firstbuyactivedetail.find(params[:id])
    @firstbuyactivedetail.destroy
    redirect_to firstbuyactive_firstbuyactivedetails_path(@firstbuyactive)
  end

  private
  def firstbuyactivedetail_params
    params.require(:firstbuyactivedetail).permit(:product_id, :number)
  end

end
