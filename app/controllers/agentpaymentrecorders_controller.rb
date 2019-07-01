class AgentpaymentrecordersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @agentpaymentrecorders = @user.agentpaymentrecorders
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @agentpaymentrecorder = @user.agentpaymentrecorders.create(agentpaymentrecorder_params)
    @user.agentpayment = @user.agentpayment.to_f + @agentpaymentrecorder.agentpayment
    @user.save!
    redirect_to user_agentpaymentrecorders_path(@user)
  end

  private

  def agentpaymentrecorder_params
    params.require(:agentpaymentrecorder).permit(:agentpayment, :paymenttime, :summary)
  end

end
