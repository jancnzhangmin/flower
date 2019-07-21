class Agentpaymentrecorder < ApplicationRecord
  belongs_to :user

  after_create :update_user_agentpayment

  private

  def update_user_agentpayment
    user = self.user
    user.agentpayment = user.agentpaymentrecorders.sum('agentpayment')
    user.save
  end

end
