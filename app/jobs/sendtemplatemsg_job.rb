class SendtemplatemsgJob < ApplicationJob
  queue_as :default

  def perform(touser, template_id, url, topcolor, data)
    $client ||= WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
    result = $client.send_template_msg(touser,template_id,url,topcolor,data)
    Log.create(log:result.to_json)
  end
end
