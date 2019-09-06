class MultibuyfullgiveproductsController < ApplicationController
  before_action :check_auth
  def index
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @activedetails = @multibuyfull.multibuyfullgiveproducts
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def new
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @multibuyfull.multibuyfullgiveproducts.create(product_id:params[:format])
    redirect_to multibuyfull_multibuyfullgiveproducts_path(@multibuyfull)
  end

  def edit
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @multibuyfullgiveproduct = Multibuyfullgiveproduct.find(params[:id])
  end

  def update
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @multibuyfullgiveproduct = Multibuyfullgiveproduct.find(params[:id])
    @multibuyfullgiveproduct.update(multibuyfullgiveproduct_params)
    redirect_to multibuyfull_multibuyfullgiveproducts_path(@multibuyfull)
  end

  def destroy
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @multibuyfullgiveproduct = Multibuyfullgiveproduct.find(params[:id])
    @multibuyfullgiveproduct.destroy
    redirect_to multibuyfull_multibuyfullgiveproducts_path(@multibuyfull)
  end

  private

  def multibuyfullgiveproduct_params
    params.require(:multibuyfullgiveproduct).permit(:buyprice)
  end

end
