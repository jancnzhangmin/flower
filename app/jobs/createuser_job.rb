class CreateuserJob < ApplicationJob
  queue_as :default

  def perform(openid)
    user = User.find_by_openid(openid)
    if !user && openid.to_s != ''
      user = User.create(openid:openid,ordermsg:1)
      user.vipid = 10000 + user.id
      user.save
    end
    $client ||= WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
    user_info = $client.user(openid)
    result = user_info.result
    user.nickname = result['nickname']
    user.headurl = result['headimgurl']
    user.save
  end
end
