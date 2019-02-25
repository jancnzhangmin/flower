class SysqrsController < ApplicationController
  before_action :set_sysqr, only: [:edit, :update]

  def index
    @manufacturers = Manufacturer.all
    sysqrcount = Sysqr.all.count
    if sysqrcount > 0
      sysqr = Sysqr.last
      redirect_to edit_sysqr_path sysqr
    else
      redirect_to new_sysqr_path
    end
  end

  def show
  end

  def new
    @sysqr = Sysqr.new
  end

  def edit
  end

  def create
    @sysqr = Sysqr.new(sysqr_params)
    respond_to do |format|
      if @sysqr.save
        format.html { redirect_to edit_sysqr_path @sysqr,  notice: 'Sysqr was successfully created.' }
        format.json { render :show, status: :created, location: @sysqr }
      else
        format.html { render :new }
        format.json { render json: @sysqr.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sysqr.update(sysqr_params)
        format.html { redirect_to edit_sysqr_path @sysqr, notice: 'Sysqr was successfully updated.' }
        format.json { render :show, status: :ok, location: @sysqr }
      else
        format.html { render :edit }
        format.json { render json: @sysqr.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sysqr
    @sysqr = Sysqr.find(params[:id])
  end

  def sysqr_params
    params.require(:sysqr).permit(:sysqr)
  end
end
