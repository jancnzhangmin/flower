class PollkuaidiJob < ApplicationJob
  queue_as :default

  def perform(deliverid)
    orderdeliver = Orderdeliver.find(deliverid)
    param={
        company:orderdeliver.comcode,
        number:orderdeliver.num,
        key:Config.first.deliverkey,
        parameters:{
            callbackurl:"http://flower.ysdsoft.com/pollcallback?deliverid=" + orderdeliver.id.to_s
        }
    }
    conn = Faraday.new(:url => 'https://poll.kuaidi100.com') do |faraday|
      faraday.request :url_encoded # form-encode POST params
      faraday.response :logger # log requests to STDOUT
      faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
    end
    conn.params[:schema] = 'json'
    conn.params[:param] = param.to_json
    request = conn.post do |req|
      req.url '/poll'
    end
  end
end
