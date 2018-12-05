class FirstbuyactivesController < ApplicationController
  before_action :set_firstbuyactive, only: [:show, :edit, :update, :destroy]

  def index
    @firstbuyactives = Firstbuyactive.all
  end

  def show
  end

  def new
    @firstbuyactive = Firstbuyactive.new
  end

  def edit
  end

  def create
    @firstbuyactive = Firstbuyactive.new(firstbuyactive_params)
    respond_to do |format|
      if @firstbuyactive.save
        format.html { redirect_to firstbuyactives_path, notice: 'Firstbuyactive was successfully created.' }
        format.json { render :show, status: :created, location: @firstbuyactive }
      else
        format.html { render :new }
        format.json { render json: @firstbuyactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @firstbuyactive.update(firstbuyactive_params)
        format.html { redirect_to firstbuyactives_path, notice: 'Firstbuyactive was successfully updated.' }
        format.json { render :show, status: :ok, location: @firstbuyactive }
      else
        format.html { render :edit }
        format.json { render json: @firstbuyactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @firstbuyactive.destroy
    respond_to do |format|
      format.html { redirect_to firstbuyactives_path, notice: 'Firstbuyactive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_firstbuyactive
    @firstbuyactive = Firstbuyactive.find(params[:id])
  end

  def firstbuyactive_params
    params.require(:firstbuyactive).permit(:name, :begintime, :endtime, :long, :status, :owerratio, :showlable, :summary)
  end
end
