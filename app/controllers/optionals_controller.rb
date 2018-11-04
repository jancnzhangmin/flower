class OptionalsController < ApplicationController
  before_action :set_product, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  def index
    @optionals = @product.optionals
  end

  def new
    @optional = @product.optionals.new
  end

  def edit
    @optional = Optional.find(params[:id])
  end

  def create
    @product.optionals.create(optional_params)
    redirect_to product_optionals_path(@product)
  end

  def update
    @product.optionals.update(optional_params)
    redirect_to product_optionals_path(@product)
  end

  def destroy
    @optional = Optional.find(params[:id])
    @optional.destroy
    redirect_to product_optionals_path(@product)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:product_id])
  end

  def optional_params
    params.require(:optional).permit(:name)
  end

end
