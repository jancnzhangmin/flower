class BuyfullactivesController < ApplicationController
  before_action :check_auth
  before_action :set_buyfullactive, only: [:show, :edit, :update, :destroy]

  def index
    @buyfullactives = Buyfullactive.all
  end

  def show
  end

  def new
    @buyfullactive = Buyfullactive.new
  end

  def edit
  end

  def create
    @buyfullactive = Buyfullactive.new(buyfullactive_params)
    respond_to do |format|
      if @buyfullactive.save
        format.html { redirect_to buyfullactives_path, notice: 'Buyfullactive was successfully created.' }
        format.json { render :show, status: :created, location: @buyfullactive }
      else
        format.html { render :new }
        format.json { render json: @buyfullactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @buyfullactive.update(buyfullactive_params)
        format.html { redirect_to buyfullactives_path, notice: 'Buyfullactive was successfully updated.' }
        format.json { render :show, status: :ok, location: @buyfullactive }
      else
        format.html { render :edit }
        format.json { render json: @buyfullactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @buyfullactive.destroy
    respond_to do |format|
      format.html { redirect_to buyfullactives_path, notice: 'Buyfullactive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_buyfullactive
    @buyfullactive = Buyfullactive.find(params[:id])
  end

  def buyfullactive_params
    params.require(:buyfullactive).permit(:name, :begintime, :endtime, :status, :showlable, :summary)
  end
end
