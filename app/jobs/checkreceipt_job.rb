class CheckreceiptJob < ApplicationJob
  queue_as :default
  #require 'sidekiq/api'
  def perform(*args)
orders = Order.where('status = 1 and receiptstatus = 0')
orders.each do |order|
  orderdelivers = order.orderdelivers
  customer = Config.first.delivercustomer
  key = Config.first.deliverkey
  param = '{"com":"' + deliver.comcode.to_s + '","num":"' + deliver.num + '"}'
  sign = Digest::MD5.hexdigest(param + key + customer).upcase
  conn = Faraday.new(:url => 'http://poll.kuaidi100.com') do |faraday|
    faraday.request :url_encoded # form-encode POST params
    faraday.response :logger # log requests to STDOUT
    faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
  end
  conn.params[:param] = param
  conn.params[:sign] = sign
  conn.params[:customer] = customer
  request = conn.post do |req|
    req.url '/poll/query.do'
  end
  result = JSON.parse(request.body)

end
    #CheckreceiptJob.set(wait: 30.minute).perform_later
  end
end
