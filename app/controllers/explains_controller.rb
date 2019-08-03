class ExplainsController < ApplicationController
  before_action :check_auth
  before_action :set_explain, only: [:show, :edit, :update, :destroy]

  def index
    @explains = Explain.all.order('id desc')
  end

  def show
  end

  def new
    @explain = Explain.new
  end

  def edit
  end

  def create
    @explain = Explain.new(explain_params)
    respond_to do |format|
      if @explain.save
        format.html { redirect_to explains_path, notice: 'Explain was successfully created.' }
        format.json { render :show, status: :created, location: @explain }
      else
        format.html { render :new }
        format.json { render json: @explain.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @explain.update(explain_params)
        format.html { redirect_to explains_path, notice: 'Explain was successfully updated.' }
        format.json { render :show, status: :ok, location: @explain }
      else
        format.html { render :edit }
        format.json { render json: @explain.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @explain.destroy
    respond_to do |format|
      format.html { redirect_to explains_path, notice: 'Explain was successfully destroyed.' }
      format.json { head :no_content }
    end
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
  def set_explain
    @explain = Explain.find(params[:id])
  end

  def explain_params
    params.require(:explain).permit(:explain, :name)
  end
end
