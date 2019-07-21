class Enaccount < ApplicationRecord
  belongs_to :user
  belongs_to :order

  after_create :cal_income

  private

  def cal_income
    user = self.user
    user.income = user.enaccounts.sum('amount')
    user.withdraw = user.income - user.withdrawrecords.sum('amount')
    user.save
  end

end
