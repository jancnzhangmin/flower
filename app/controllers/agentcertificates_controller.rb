class AgentcertificatesController < ApplicationController
  before_action :check_auth
  def index
    @agentuser = User.find(params[:agentuser_id])
    @agentcertificates = @agentuser.agent.agentcertificates
  end

  def create
    agentuser = User.find(params[:agentuser_id])
    agentuser.agent.agentcertificates.create(agentcertificate:params[:agentcertificate])
    redirect_to agentuser_agentcertificates_path(agentuser)
  end

  def destroy
    agentcertificate =  Agentcertificate.find(params[:id])
    agentcertificate.destroy
    agentuser = User.find(params[:agentuser_id])
    redirect_to agentuser_agentcertificates_path(agentuser)
  end

end
