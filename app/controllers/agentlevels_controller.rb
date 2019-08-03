class AgentlevelsController < ApplicationController
  before_action :check_auth
  before_action :set_agentlevel, only: [:show, :edit, :update, :destroy]

  def index
    @agentlevels = Agentlevel.all.order('corder')
  end

  def show
  end

  def new
    @agentlevel = Agentlevel.new
  end

  def edit
  end

  def create
    @agentlevel = Agentlevel.new(agentlevel_params)
    respond_to do |format|
      if @agentlevel.save!
        @agentlevel.corder = @agentlevel.id
        @agentlevel.save
        format.html { redirect_to agentlevels_path, notice: 'Agentlevel was successfully created.' }
        format.json { render :show, status: :created, location: @agentlevel }
      else
        format.html { render :new }
        format.json { render json: @agentlevel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @agentlevel.update(agentlevel_params)
        format.html { redirect_to agentlevels_path, notice: 'Agentlevel was successfully updated.' }
        format.json { render :show, status: :ok, location: @agentlevel }
      else
        format.html { render :edit }
        format.json { render json: @agentlevel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @agentlevel.destroy
    respond_to do |format|
      format.html { redirect_to agentlevels_path, notice: 'Agentlevel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def order_up
    agentlevel = Agentlevel.find(params[:id])
    prev_level = Agentlevel.where("corder < ?",agentlevel.corder).order('corder').last
    if prev_level
      corder = agentlevel.corder
      agentlevel.corder = prev_level.corder
      prev_level.corder = corder
      agentlevel.save
      prev_level.save
    end
    redirect_to agentlevels_path
  end

  def order_down
    agentlevel = Agentlevel.find(params[:id])
    prev_level = Agentlevel.where("corder > ?",agentlevel.corder).order('corder').first
    if prev_level
      corder = agentlevel.corder
      agentlevel.corder = prev_level.corder
      prev_level.corder = corder
      agentlevel.save
      prev_level.save
    end
    redirect_to agentlevels_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_agentlevel
    @agentlevel = Agentlevel.find(params[:id])
  end

  def agentlevel_params
    params.require(:agentlevel).permit(:name, :corder, :grant, :amount, :task, :deposit, :frontend)
  end
end
