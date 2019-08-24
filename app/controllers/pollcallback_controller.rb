class PollcallbackController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    orderdeliver = Orderdeliver.find(params[:deliverid])
    if orderdeliver
      orderdeliver.message = params[:param]
      result = JSON.parse(params[:param])
      order = orderdeliver.order
      data={
          "first": {
          "value":'你的快递已安排发货'
      },
          "keyword1":{
          "value":order.ordernumber
      },
          "keyword2":{
          "value":orderdeliver.name
      },
          "keyword3": {
          "value":orderdeliver.num
      },
          "remark":{
          "value": ''
      }
      }
      user = order.user
      if orderdeliver.status == -1 && result['lastResult']['state']
        SendtemplatemsgJob.perform_later(user.openid,'XNzGd_km2I5Bz9GIGpjEXt53yPiOMxJSQx_tqm6wcRI','http://flower.ysdsoft.com/getopenids','#173177',data)
      end
      orderdeliver.status = result['lastResult']['state']
      orderdeliver.save
      order.deliverstatus = 1
      order.save
      orderdelivercount = 0
      orderdelivers = order.orderdelivers
      orderdelivers.each do |deliver|
        if deliver.status == 3
          orderdelivercount += 1
        end
      end
      if orderdelivercount == orderdelivers.size
        order.receiptstatus = 1
        order.autoreceipttime = Time.now
        order.save
      end


    end
    render json: '{"result":true,"returnCode":"200","message":"接收成功"}'
  end
end
