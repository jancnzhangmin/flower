class ConfigsController < ApplicationController
  before_action :check_auth
  before_action :set_config, only: [:edit, :update]
  def index
    @config = Config.last
    redirect_to edit_config_path(@config)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to edit_config_path(@config), notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @config }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_config
    @config = Config.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def config_params
    params.require(:config).permit(:appid, :appsecret, :autocomment, :minbankamount, :amapareakey, :autoreceipt, :deliverkey, :delivercustomer, :qrdemo, :headdemo, :displaysale)
  end

end
