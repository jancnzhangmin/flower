class SecondactivesController < ApplicationController

  before_action :set_secondactive, only: [:show, :edit, :update, :destroy]

  def index
    @secondactives = Secondactive.all
  end

  def show
  end

  def new
    @secondactive = Secondactive.new
  end

  def edit
  end

  def create
    @secondactive = Secondactive.new(secondactive_params)
    respond_to do |format|
      if @secondactive.save
        format.html { redirect_to secondactives_path, notice: 'Secondactive was successfully created.' }
        format.json { render :show, status: :created, location: @secondactive }
      else
        format.html { render :new }
        format.json { render json: @secondactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @secondactive.update(secondactive_params)
        format.html { redirect_to secondactives_path, notice: 'Secondactive was successfully updated.' }
        format.json { render :show, status: :ok, location: @secondactive }
      else
        format.html { render :edit }
        format.json { render json: @secondactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @secondactive.destroy
    respond_to do |format|
      format.html { redirect_to secondactives_path, notice: 'Secondactive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_secondactive
    @secondactive = Secondactive.find(params[:id])
  end

  def secondactive_params
    params.require(:secondactive).permit(:name, :begintime, :endtime, :long, :status, :summary, :firstprofit, :secondprofit)
  end

end
