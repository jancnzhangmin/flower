class OrderdeliversController < ApplicationController
  before_action :check_auth
  before_action :set_orderdeliver, only: [:index, :create, :show, :edit, :update, :destroy]

  def index
    @orderdelivers = @order.orderdelivers
  end

  def show
  end

  def new

  end

  def edit
  end

  def create
    orderdeliver = @order.orderdelivers.create(orderdeliver_params)
    orderdeliver.status = -1
    orderdeliver.save
      #AutoreceiptJob.set(wait: Config.first.autoreceipt.days).perform_later(@order.id)
      PollkuaidiJob.perform_later(orderdeliver.id)
    redirect_to order_orderdelivers_path(@order)
  end

  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        format.html { redirect_to manufacturers_path, notice: 'Manufacturer was successfully updated.' }
        format.json { render :show, status: :ok, location: @manufacturer }
      else
        format.html { render :edit }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to manufacturers_path, notice: 'Manufacturer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_delivername
    conn = Faraday.new(:url => 'http://www.kuaidi100.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get do |req|
      req.url '/autonumber/auto'
      req.params['num'] = params[:num]
      req.params['key'] = Config.first.deliverkey
    end

    arr = []
    JSON.parse(response.body).each do |f|
      deliver = Delivercode.find_by_comcode(f["comCode"])
      param = {
          name:deliver.name,
          comcode:deliver.comcode
      }
      arr.push param
    end
    render json: '{"delivers": ' + arr.to_json + '}'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_orderdeliver
    @order = Order.find(params[:order_id])
  end

  def orderdeliver_params
    params.require(:orderdeliver).permit(:name, :comcode, :num)
  end

end
