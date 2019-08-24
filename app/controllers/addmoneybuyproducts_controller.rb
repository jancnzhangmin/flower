class AddmoneybuyproductsController < ApplicationController
  before_action :check_auth
  def index
    @addmoneyactive = Addmoneyactive.find(params[:addmoneyactive_id])
    @activedetails = @addmoneyactive.addmoneybuyproducts
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def new
    @addmoneyactive = Addmoneyactive.find(params[:addmoneyactive_id])
    @addmoneyactive.addmoneybuyproducts.create(product_id:params[:format])
    redirect_to addmoneyactive_addmoneybuyproducts_path(@addmoneyactive)
  end

  def destroy
    @addmoneyactive = Addmoneyactive.find(params[:addmoneyactive_id])
    @addmoneybuyproduct = Addmoneybuyproduct.find(params[:id])
    @addmoneybuyproduct.destroy
    redirect_to addmoneyactive_addmoneybuyproducts_path(@addmoneyactive)
  end

end
