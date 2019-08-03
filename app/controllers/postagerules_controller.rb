class PostagerulesController < ApplicationController
  before_action :check_auth
  before_action :set_postagerule, only: [:show, :edit, :update, :destroy]

  def index
    @postagerules = Postagerule.all
  end

  def show
  end

  def new
    @postagerule = Postagerule.new
  end

  def edit
  end

  def create
    @postagerule = Postagerule.new(postagerule_params)
    respond_to do |format|
      if @postagerule.save
        format.html { redirect_to postagerules_path, notice: 'Postagerule was successfully created.' }
        format.json { render :show, status: :created, location: @postagerule }
      else
        format.html { render :new }
        format.json { render json: @postagerule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @postagerule.update(postagerule_params)
        format.html { redirect_to postagerules_path, notice: 'Postagerule was successfully updated.' }
        format.json { render :show, status: :ok, location: @postagerule }
      else
        format.html { render :edit }
        format.json { render json: @postagerule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @postagerule.destroy
    respond_to do |format|
      format.html { redirect_to postagerules_path, notice: 'Postagerule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_postagerule
    @postagerule = Postagerule.find(params[:id])
  end

  def postagerule_params
    params.require(:postagerule).permit(:name, :startpostage, :ordernumber, :endpostage, :status)
  end
end
