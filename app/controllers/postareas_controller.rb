class PostareasController < ApplicationController
  before_action :check_auth
  def index
    @postagerule = Postagerule.find(params[:postagerule_id])
    @postareas = @postagerule.postareas
  end

  def updatearea
    @postagerule = Postagerule.find(params[:postagerule_id])
    @postareas = @postagerule.postareas
    @postareas.destroy_all
    if params[:adcodes]
      params[:adcodes].keys.each do |f|
        @postagerule.postareas.create(adcode:params[:adcodes][f][:adcode], province:params[:adcodes][f][:province])
      end
    end
    #redirect_to postagerules_path
    render json: @postagerule.to_json
  end

end
