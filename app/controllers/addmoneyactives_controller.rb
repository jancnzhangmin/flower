class AddmoneyactivesController < ApplicationController
  before_action :check_auth
  before_action :set_addmoneyactive, only: [:show, :edit, :update, :destroy]

  def index
    @addmoneyactives = Addmoneyactive.all
  end

  def show
  end

  def new
    @addmoneyactive = Addmoneyactive.new
  end

  def edit
  end

  def create
    @addmoneyactive = Addmoneyactive.new(addmoneyactive_params)
    respond_to do |format|
      if @addmoneyactive.save
        format.html { redirect_to addmoneyactives_path, notice: 'Addmoneyactive was successfully created.' }
        format.json { render :show, status: :created, location: @addmoneyactive }
      else
        format.html { render :new }
        format.json { render json: @addmoneyactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @addmoneyactive.update(addmoneyactive_params)
        format.html { redirect_to addmoneyactives_path, notice: 'Addmoneyactive was successfully updated.' }
        format.json { render :show, status: :ok, location: @addmoneyactive }
      else
        format.html { render :edit }
        format.json { render json: @addmoneyactive.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @addmoneyactive.destroy
    respond_to do |format|
      format.html { redirect_to addmoneyactives_path, notice: 'Addmoneyactive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_addmoneyactive
    @addmoneyactive = Addmoneyactive.find(params[:id])
  end

  def addmoneyactive_params
    params.require(:addmoneyactive).permit(:name, :buynumber, :givenumber, :begintime, :endtime, :status, :amount, :showlable, :summary)
  end
end
