class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order('addtop desc')
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    full_params = product_params.merge(pinyin(product_params[:name]))
    @product = Product.new(full_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      full_params = product_params.merge(pinyin(product_params[:name]))
      if @product.update(full_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addtop
    product = Product.find(params[:product_id])
    if product.addtop == 1
      product.addtop = 0
    else
      product.addtop = 1
    end
    product.save
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:manufacturer_id, :name, :cost, :price, :content, :grounding, :unit, :spec, :subtitle, :weight, :brand, :pack, :season)
  end

  def pinyin(str)
    pin = PinYin.sentence(str).tr(" ",'')
    fullpin = ''
    funpinarr = PinYin.sentence(str).split(" ")
    if funpinarr.length > 0
      funpinarr.each do |f|
        fullpin  += f[0]
      end
    end
    params = {
        pinyin:pin,
        fullpinyin:fullpin
    }
  end

end
