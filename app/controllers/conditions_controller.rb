class ConditionsController < ApplicationController
  before_action :set_optional, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  def index
    @conditions = @optional.conditions
  end

  def new
    @condition = @optional.conditions.new
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def create
    @condition = @optional.conditions.create(optional_params)
    redirect_to product_optional_conditions_path(@product,@optional)
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.update(optional_params)
    redirect_to product_optional_conditions_path(@product,@optional)
  end

  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy
    redirect_to product_optional_conditions_path(@product,@optional)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_optional
    @product = Product.find(params[:product_id])
    @optional = Optional.find(params[:optional_id])
  end

  def optional_params
    params.require(:condition).permit(:name, :weighting)
  end
end
