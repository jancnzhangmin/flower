class MashupbuyproductsController < ApplicationController

  before_action :check_auth
  def index
    @mashup = Mashup.find(params[:mashup_id])
    @activedetails = @mashup.mashupbuyproducts
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def new
    @mashup = Mashup.find(params[:mashup_id])
    @mashup.mashupbuyproducts.create(product_id:params[:format])
    redirect_to mashup_mashupbuyproducts_path(@mashup)
  end

  def edit
    @mashup = Mashup.find(params[:mashup_id])
    @mashupbuyproduct = Mashupbuyproduct.find(params[:id])
  end

  def update
    @mashup = Mashup.find(params[:mashup_id])
    @mashupbuyproduct = Mashupbuyproduct.find(params[:id])
    @mashupbuyproduct.update(mashupbuyproduct_params)
    redirect_to mashup_mashupbuyproducts_path(@mashup)
  end

  def destroy
    @mashup = Mashup.find(params[:mashup_id])
    @mashupbuyproduct = Mashupbuyproduct.find(params[:id])
    @mashupbuyproduct.destroy
    redirect_to mashup_mashupbuyproducts_path(@mashup)
  end

  private

  def mashupbuyproduct_params
    params.require(:mashupbuyproduct).permit(:product_id)
  end

end
