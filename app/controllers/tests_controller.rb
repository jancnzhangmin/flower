class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /tests
  # GET /tests.json

  def index

    @tests = Test.all


    if params[:ordernumber]
      mergeorder = Mergepayorder.find_by_ordernumber(params[:ordernumber])
      if mergeorder.paystatus == 0
        mergeorder.paystatus = 1
        mergeorder.paytime = Time.now
        mergeorder.save
        orderids = mergeorder.orderids.split(',')
        orderids.each do |orderid|
          order = Order.find(orderid)
          order.paystatus = 1
          order.paytime = Time.now
          order.save
          cablewxmessage('order',order.id,0)
        end
        AfterpayJob.perform_later(mergeorder.id)
      end
    end
    render :xml => {return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false)

    #ActionCable.server.broadcast 'wxmessage_channel',message:'这是websocket的对接测试'
    #ActionCable.server.broadcast '',message:'asdfasdfsadf'
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deliver
    params[:Workbook]["Worksheet"]["Table"]["Row"].each do |f|
      Delivercode.create(name:f["Cell"][0]["Data"]["text"],comcode:f["Cell"][1]["Data"]["text"])
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_params
    params.require(:test).permit(:name, :age)
  end
end
