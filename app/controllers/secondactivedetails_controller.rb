class SecondactivedetailsController < ApplicationController

  def index
    @secondactive = Secondactive.find(params[:secondactive_id])
    @activedetails = @secondactive.secondactivedetails
    activeproducts = [0]
    @activedetails.each do |a|
      activeproducts.push(a.product_id)
    end
    @nonactivedetails = Product.where('id not in(?)',activeproducts)
  end

  def new
    @secondactive = Secondactive.find(params[:secondactive_id])
  end

  def newproduct
    @secondactive = Secondactive.find(params[:secondactive_id])
  end

  def singleaddactive
    @secondactive = Secondactive.find(params[:secondactive_id])
    @secondactive.secondactivedetails.create(product_id:params[:id])
    redirect_to secondactive_secondactivedetails_path(@secondactive)
  end

  def singleremoveactive
    @secondactive = Secondactive.find(params[:secondactive_id])
    secondactivedetail = Secondactivedetail.find(params[:id])
    secondactivedetail.destroy
    redirect_to secondactive_secondactivedetails_path(@secondactive)
  end

  def addactive
    @secondactive = Secondactive.find(params[:secondactive_id])
    if params[:product_ids]
      params[:product_ids].each do |f|
        @secondactive.secondactivedetails.create(product_id:f)
      end
    end
    redirect_to secondactive_secondactivedetails_path(@secondactive)
  end

  def removeactive
    @secondactive = Secondactive.find(params[:secondactive_id])
    secondactivedetails = @secondactive.secondactivedetails
    secondactivedetails.each do |f|
      localarr = Array.new
      localarr.push(f.id)
      if params[:remove_ids] & localarr
        f.destroy
      end
    end
    redirect_to secondactive_secondactivedetails_path(@secondactive)
  end

  def create
  end

end
