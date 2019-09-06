class MultibuyfullsController < ApplicationController
  before_action :check_auth
  before_action :set_multibuyfull, only: [:show, :edit, :update, :destroy]

  def index
    @multibuyfulls = Multibuyfull.all
  end

  def show
  end

  def new
    @multibuyfull = Multibuyfull.new
  end

  def edit
  end

  def create
    @multibuyfull = Multibuyfull.new(multibuyfull_params)
    respond_to do |format|
      if @multibuyfull.save
        format.html { redirect_to multibuyfulls_path, notice: 'Multibuyfull was successfully created.' }
        format.json { render :show, status: :created, location: @multibuyfull }
      else
        format.html { render :new }
        format.json { render json: @multibuyfull.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @multibuyfull.update(multibuyfull_params)
        format.html { redirect_to multibuyfulls_path, notice: 'Multibuyfull was successfully updated.' }
        format.json { render :show, status: :ok, location: @multibuyfull }
      else
        format.html { render :edit }
        format.json { render json: @multibuyfull.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @multibuyfull.destroy
    respond_to do |format|
      format.html { redirect_to multibuyfulls_path, notice: 'Multibuyfull was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_multibuyfull
    @multibuyfull = Multibuyfull.find(params[:id])
  end

  def multibuyfull_params
    params.require(:multibuyfull).permit(:name, :begintime, :endtime, :status, :showlable, :summary)
  end
end
