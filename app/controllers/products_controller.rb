class ProductsController < ApplicationController
  before_action :check_auth
  before_action :set_product, only: [:show, :edit, :update, :destroy, :up, :down]

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 15).order('corder')
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
        @product.corder = @product.id
        @product.save
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

  def agentprice
    @product = Product.find(params[:id])
    agentlevels = Agentlevel.all.order('corder')
    agentlevels.each do |agentlevel|
      agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,@product.id)
      if agentprice.size == 0
        Agentprice.create(product_id:@product.id,agentlevel_id:agentlevel.id,price:0)
      end
    end
    @agentprices = Agentprice.where('agentlevel_id in (?) and product_id = ?',agentlevels.ids,@product.id)
    @agentpricearr = Array.new
    agentlevels.each do |agentlevel|
      agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,@product.id).first
      option = {
          agentprice_id:agentprice.id,
          name:agentlevel.name,
          price:agentprice.price
      }
      @agentpricearr.push option
    end
  end

  def saveagentprice
    params[:agentprice].each do |op|
      agentprice = Agentprice.find(op[:agentprice_id])
      agentprice.price = op[:price]
      agentprice.save
    end
    #product = Product.find(params[:product_id])
    redirect_to products_path
  end

  def up
    products = Product.where('corder < ?',@product.corder).order('corder desc')
    if products.size > 0
      temorder = products.first.corder
      products.first.corder = @product.corder
      products.first.save
      @product.corder = temorder
      @product.save
    end
    redirect_to products_path
  end

  def down
    products = Product.where('corder > ?',@product.corder).order('corder')
    if products.size > 0
      temorder = products.first.corder
      products.first.corder = @product.corder
      products.first.save
      @product.corder = temorder
      @product.save
    end
    redirect_to products_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:manufacturer_id, :name, :cost, :price, :content, :grounding, :unit, :spec, :subtitle, :weight, :brand, :pack, :season, :intask, :shelflife, :trial)
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
