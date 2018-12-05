class LimitactivesController < ApplicationController
  before_action :set_limitactive, only: [:show, :edit, :update, :destroy]

  def index
    @limitactives = Limitactive.all
  end

  def show
  end

  def new
    @limitactive = Limitactive.new
  end

  def edit
  end

  def create
    @limitactive = Limitactive.new(limitactive_params)
    respond_to do |format|
      if @limitactive.save
        format.html { redirect_to limitactives_path, notice: 'Limitactive was successfully created.' }
        format.json { render :show, status: :created, location: @limitactive }
      else
        format.html { render :new }
        format.json { render json: @limitactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @limitactive.update(limitactive_params)
        format.html { redirect_to limitactives_path, notice: 'Limitactive was successfully updated.' }
        format.json { render :show, status: :ok, location: @limitactive }
      else
        format.html { render :edit }
        format.json { render json: @limitactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @limitactive.destroy
    respond_to do |format|
      format.html { redirect_to limitactives_path, notice: 'Firstbuyactive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_limitactive
    @limitactive = Limitactive.find(params[:id])
  end

  def limitactive_params
    params.require(:limitactive).permit(:name, :begintime, :endtime, :status, :owerratio, :showlable, :summary)
  end
end
