class AgentpaymentrecordersController < ApplicationController
  before_action :check_auth
  def index
    @user = nil
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(agentuser_id)
    end
    @agentpaymentrecorders = @user.agentpaymentrecorders
  end

  def new
    if params[:user_id]
    @user = User.find(params[:user_id])
    else
      @user = User.find(params[:agentuser_id])
    end
  end

  def create
    @user = nil
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(params[:agentuser_id])
    end

    @agentpaymentrecorder = @user.agentpaymentrecorders.create(agentpaymentrecorder_params)
    @agentpaymentrecorder.paymenttime = Time.now
    @agentpaymentrecorder.save
    redirect_to user_agentpaymentrecorders_path(@user)
  end

  private

  def agentpaymentrecorder_params
    params.require(:agentpaymentrecorder).permit(:agentpayment, :paymenttime, :summary)
  end

end
