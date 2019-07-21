class DeletebuycarJob < ApplicationJob
  queue_as :default

  def perform(userid)
    user = User.find(userid)
    buycars = user.buycars
    buycars.destroy_all
  end
end
