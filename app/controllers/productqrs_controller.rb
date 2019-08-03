class ProductqrsController < ApplicationController
  before_action :check_auth
  before_action :set_product, only: [:index, :new, :create, :edit, :update, :destroy]
  def index
    @productqrs = @product.productqrs
  end

  def new
    @productqr = @product.productqrs.new
  end

  def create
    @productqr = @product.productqrs.create(productqr_params)
    @productqr.qrjson = ''
    @productqr.save
    redirect_to edit_product_productqr_path(@product,@productqr)
  end

  def edit
    @productqr = Productqr.find(params[:id])
  end

  def update
    @productqr = Productqr.find(params[:id])
    @productqr.update(productqr_params)
    @productqr.qrjson = @productqr.qrjson.gsub("\\n","")
    @productqr.save
    redirect_to edit_product_productqr_path(@product,@productqr)
  end

  def destroy
    @productqr = Productqr.find(params[:id])
    @productqr.destroy
    redirect_to product_productqrs_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def productqr_params
    params.require(:productqr).permit(:productqrbase,:qrjson)
  end

end
