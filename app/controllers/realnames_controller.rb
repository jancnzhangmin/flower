class RealnamesController < ApplicationController
  before_action :set_realname, only: [:show, :edit, :update, :destroy]

  def index
    @realnames = Realname.all.order('id desc')
  end

  def show
  end

  def new
    @realname = Realname.new
  end

  def edit
  end

  def create
    @realname = Realname.new(realname_params)
    respond_to do |format|
      if @realname.save
        format.html { redirect_to realnames_path, notice: 'Realname was successfully created.' }
        format.json { render :show, status: :created, location: @realname }
      else
        format.html { render :new }
        format.json { render json: @realname.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:status] == '0'
      @realname.examinestatus = 1
    elsif params[:status] == '1'
      @realname.examinestatus = 0
    elsif params[:status] == '2'
      @realname.examinestatus = 1
      @realname.adjust = 1
    end
    @realname.adjustsummary = params[:realname][:adjustsummary]
    @realname.save
    redirect_to realnames_path
  end

  def destroy
    @realname.destroy
    respond_to do |format|
      format.html { redirect_to realnames_path, notice: 'Realname was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_realname
    @realname = Realname.find(params[:id])
  end

  def realname_params
    params.require(:realname).permit(:examinestatus, :adjust, :idfront, :idback, :adjustsummary)
  end
end
