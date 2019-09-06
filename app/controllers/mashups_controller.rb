class MashupsController < ApplicationController
  before_action :check_auth
  before_action :set_mashup, only: [:show, :edit, :update, :destroy]

  def index
    @mashups = Mashup.all
  end

  def show
  end

  def new
    @mashup = Mashup.new
  end

  def edit
  end

  def create
    @mashup = Mashup.new(mashup_params)
    respond_to do |format|
      if @mashup.save
        format.html { redirect_to mashups_path, notice: 'Mashup was successfully created.' }
        format.json { render :show, status: :created, location: @mashup }
      else
        format.html { render :new }
        format.json { render json: @mashup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mashup.update(mashup_params)
        format.html { redirect_to mashups_path, notice: 'Mashup was successfully updated.' }
        format.json { render :show, status: :ok, location: @mashup }
      else
        format.html { render :edit }
        format.json { render json: @mashup.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mashup.destroy
    respond_to do |format|
      format.html { redirect_to mashups_path, notice: 'Mashup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_mashup
    @mashup = Mashup.find(params[:id])
  end

  def mashup_params
    params.require(:mashup).permit(:name, :begintime, :endtime, :status, :showlable, :summary, :buynumber, :giveproduct_id)
  end
end
