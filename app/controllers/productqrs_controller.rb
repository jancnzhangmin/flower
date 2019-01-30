class ProductqrsController < ApplicationController
  before_action :set_product, only: [:index, :new, :create, :edit]
  def index
    @productqrs = @product.productqrs
  end

  def new
    @productqr = @product.productqrs.new
  end

  def create
    @productqr = @product.productqrs.create(productqr_params)
    redirect_to product_productqr_path(@product,@productqr)
  end

  def edit
    @productqr = Productqr.find(params[:id])
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def productqr_params
    params.require(:productqr).permit(:productqrbase)
  end

end
