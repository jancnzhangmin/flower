class AddmoneygiveproductsController < ApplicationController
  before_action :check_auth
  def index
    @addmoneyactive = Addmoneyactive.find(params[:addmoneyactive_id])
    @activedetails = @addmoneyactive.addmoneygiveproducts
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def new
    @addmoneyactive = Addmoneyactive.find(params[:addmoneyactive_id])
    @addmoneyactive.addmoneygiveproducts.create(product_id:params[:format])
    redirect_to addmoneyactive_addmoneygiveproducts_path(@addmoneyactive)
  end

  def destroy
    @addmoneyactive = Addmoneyactive.find(params[:addmoneyactive_id])
    @addmoneygiveproduct = Addmoneygiveproduct.find(params[:id])
    @addmoneygiveproduct.destroy
    redirect_to addmoneyactive_addmoneygiveproducts_path(@addmoneyactive)
  end
end
