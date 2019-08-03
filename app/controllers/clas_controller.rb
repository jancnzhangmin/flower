class ClasController < ApplicationController
  before_action :check_auth
  before_action :set_cla, only: [:show, :edit, :update, :destroy, :up, :down]

  def index
    @clas = Cla.all.order('clas.order')
  end

  def show
  end

  def new
    @cla = Cla.new
  end

  def edit
  end

  def create
    @cla = Cla.new(cla_params)
    respond_to do |format|
      if @cla.save
        @cla.order = @cla.id
        @cla.save
        format.html { redirect_to clas_path, notice: 'Cla was successfully created.' }
        format.json { render :show, status: :created, location: @cla }
      else
        format.html { render :new }
        format.json { render json: @cla.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cla.update(cla_params)
        format.html { redirect_to clas_path, notice: 'Cla was successfully updated.' }
        format.json { render :show, status: :ok, location: @cla }
      else
        format.html { render :edit }
        format.json { render json: @cla.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cla.destroy
    respond_to do |format|
      format.html { redirect_to clas_path, notice: 'Cla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def up
    clas = Cla.where('clas.order < ?',@cla.order).order('clas.order desc')
    if clas.count > 0
      temorder = clas.first.order
      clas.first.order = @cla.order
      clas.first.save
      @cla.order = temorder
      @cla.save
    end
    redirect_to clas_path
  end

  def down
    clas = Cla.where('clas.order > ?',@cla.order).order('clas.order')
    if clas.count > 0
      temorder = clas.first.order
      clas.first.order = @cla.order
      clas.first.save
      @cla.order = temorder
      @cla.save
    end
    redirect_to clas_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cla
    @cla = Cla.find(params[:id])
  end

  def cla_params
    params.require(:cla).permit(:name, :order, :keyword, :showinproduct)
  end
end
