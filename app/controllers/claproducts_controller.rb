class ClaproductsController < ApplicationController
  before_action :set_cla, only: [:show, :edit, :update, :destroy, :singleadd, :singleremove, :add, :remove]
  def index
    @cla = Cla.find(params[:cla_id])
    @activedetails = @cla.products
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def singleadd
    claproduct = Product.find(params[:id])
    @cla.products << claproduct
    redirect_to cla_claproducts_path(@cla)
  end

  def singleremove
    claproduct = Product.find(params[:id])
    @cla.products.destroy(claproduct)
    redirect_to cla_claproducts_path(@cla)
  end

  def add
    if params[:product_ids]
      params[:product_ids].each do |p|
        @cla.products << Product.find(p)
      end
    end
    redirect_to cla_claproducts_path(@cla)
  end

  def remove
    if params[:remove_ids]
      params[:remove_ids].each do |p|
        @cla.products.destroy(Product.find(p))
      end
    end
    redirect_to cla_claproducts_path(@cla)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cla
    @cla = Cla.find(params[:cla_id])
  end
end
