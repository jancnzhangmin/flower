class MultibuyfullbuyproductsController < ApplicationController
  before_action :check_auth
  def index
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @activedetails = @multibuyfull.multibuyfullbuyproducts
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def new
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @multibuyfull.multibuyfullbuyproducts.create(product_id:params[:format])
    redirect_to multibuyfull_multibuyfullbuyproducts_path(@multibuyfull)
  end

  def destroy
    @multibuyfull = Multibuyfull.find(params[:multibuyfull_id])
    @multibuyfullbuyproduct = Multibuyfullbuyproduct.find(params[:id])
    @multibuyfullbuyproduct.destroy
    redirect_to multibuyfull_multibuyfullbuyproducts_path(@multibuyfull)
  end
end
