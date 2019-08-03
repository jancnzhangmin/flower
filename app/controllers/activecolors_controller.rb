class ActivecolorsController < ApplicationController
  before_action :check_auth
  before_action :set_activecolor, only: [:show, :edit, :update, :destroy]

  def index
    @activecolors = Activecolor.all
  end

  def show
  end

  def new
    @activecolor = Activecolor.new
  end

  def edit
  end

  def create
    @activecolor = Activecolor.new(activecolor_params)
    respond_to do |format|
      if @activecolor.save
        format.html { redirect_to activecolors_path, notice: 'Activecolor was successfully created.' }
        format.json { render :show, status: :created, location: @activecolor }
      else
        format.html { render :new }
        format.json { render json: @activecolor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activecolor.update(activecolor_params)
        format.html { redirect_to activecolors_path, notice: 'Activecolor was successfully updated.' }
        format.json { render :show, status: :ok, location: @activecolor }
      else
        format.html { render :edit }
        format.json { render json: @activecolor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activecolor.destroy
    respond_to do |format|
      format.html { redirect_to activecolors_path, notice: 'Activecolor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_activecolor
    @activecolor = Activecolor.find(params[:id])
  end

  def activecolor_params
    params.require(:activecolor).permit(:name, :frontcolor, :shadowcolor)
  end
end
