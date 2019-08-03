class ExplainproductsController < ApplicationController
  before_action :check_auth
  before_action :set_explain, only: [:index, :singleadd, :singleremove, :addexplain, :removeexplain]
  def index
    @activedetails = @explain.products
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def singleadd
    @explain.products << Product.find(params[:id])
    redirect_to explain_explainproducts_path(@explain)
  end

  def singleremove
    product = Product.find(params[:id])
    @explain.products.destroy(product)
    redirect_to explain_explainproducts_path(@explain)
  end

  def addexplain
    if params[:product_ids]
      params[:product_ids].each do |f|
        #@secondactive.secondactivedetails.create(product_id:f)
        @explain.products << Product.find(f)
      end
    end
    redirect_to explain_explainproducts_path(@explain)
  end

  def removeexplain
    if params[:remove_ids]
      params[:remove_ids].each do |p|
        @explain.products.destroy(Product.find(p))
      end
    end
    redirect_to explain_explainproducts_path(@explain)
  end

  private
  def set_explain
    @explain = Explain.find(params[:explain_id])
  end
end
