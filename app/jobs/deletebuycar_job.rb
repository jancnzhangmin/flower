class DeletebuycarJob < ApplicationJob
  queue_as :default

  def perform(userid)
    Buycar.transaction do
      user = User.find(userid)
      buycars = user.buycars
      buycars.each do |buycar|
        buycar.destroy
      end
    end
  end
end
