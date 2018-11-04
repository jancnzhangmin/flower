class ProductimgsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @productimg = @product.productimgs.create(productimg_params)
    hasdefault = false
    @product.productimgs.each do |p|
      if p.isdefault == 1
        hasdefault = true
      end
    end
    if !hasdefault
      first = @product.productimgs.first
      first.isdefault = 1
      first.save
    end
    redirect_to product_productimgs_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    productimg = Productimg.find(params[:id])
    productimg.destroy
    if @product.productimgs.count > 0
      hasdefault = false
      @product.productimgs.each do |p|
        if p.isdefault == 1
          hasdefault = true
        end
      end
      if !hasdefault
        first = @product.productimgs.first
        first.isdefault = 1
        first.save
      end
    end
    redirect_to product_productimgs_path(@product)
  end

  def setdefault
    @product = Product.find(params[:product_id])
    productimgs = @product.productimgs
    productimgs.each do |p|
      p.isdefault = 0
      p.save
    end
    productimg = Productimg.find(params[:id])
    productimg.isdefault = 1
    productimg.save
    redirect_to product_productimgs_path(@product)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def productimg_params
    params.require(:productimg).permit(:productimg)
  end

end
