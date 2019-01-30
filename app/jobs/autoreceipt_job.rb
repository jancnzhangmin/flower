class AutoreceiptJob < ApplicationJob
  queue_as :default

  def perform(orderid)
    order = Order.find(orderid)
    if order.status == 1 && order.receiptstatus == 0
      order.autoreceipttime = Time.now
      order.receiptstatus = 1
      order.save
      AutocommentJob.set(wait: Config.first.autocomment.days).perform_later(orderid)
    end
  end
end
