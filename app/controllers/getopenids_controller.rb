class GetopenidsController < ApplicationController

  def getopenid
    conn = Faraday.new(:url => 'https://api.weixin.qq.com') do |faraday|
      faraday.request :url_encoded # form-encode POST params
      faraday.response :logger # log requests to STDOUT
      faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
    end
    # conn.headers[:apikey] = '6e1802f8c0cd1b42b32249ba42c2e602'
    conn.params[:appid] = Config.first.appid
    conn.params[:secret] = Config.first.appsecret
    conn.params[:code] = params[:code]
    conn.params[:grant_type] = 'authorization_code'
    request = conn.get do |req|
      req.url '/sns/oauth2/access_token'
    end
    #return request.body

    #//////////////////////////////////////////////////////////
    #location = getip(params[:ip])
    accessjson = request.body.to_json

    openid = JSON.parse(request.body)['openid']
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
    #CreateuserJob.perform_later(JSON.parse(request.body)['openid'])
    render json: params[:callback]+'({"access_token":' + accessjson + '})',content_type: "application/javascript"
  end
end
