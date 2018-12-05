class FreepostsController < ApplicationController
  before_action :set_freepost, only: [:edit, :update]
  def index
    @freepost = Freepost.last
    if !@freepost
      @freepost = Freepost.create(content:'')
    end
    redirect_to edit_freepost_path(@freepost)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @freepost.update(freepost_params)
        format.html { redirect_to edit_freepost_path(@freepost), notice: 'Freepost was successfully updated.' }
        format.json { render :show, status: :ok, location: @freepost }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @freepost.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_freepost
    @freepost = Freepost.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def freepost_params
    params.require(:freepost).permit(:content)
  end
end
