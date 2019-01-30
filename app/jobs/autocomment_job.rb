class AutocommentJob < ApplicationJob
  queue_as :default

  def perform(orderid)
    order = Order.find(orderid)
    if order.status == 1 && order.commentstatus == 0
      order.autocommenttime = Time.now
      order.commentstatus = 1
      order.save
    end
  end
end
