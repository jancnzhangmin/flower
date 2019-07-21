class CablewxmessageJob < ApplicationJob
  queue_as :default

  def perform(keyword,userid) #user 新增用户 order 用户购买 agent成为代理 userid只在keyword为agent时有效
    name = ''
    message = ''
    if keyword == 'order'
      order = Order.last
      orderdetail = order.orderdetails.first
      product = orderdetail.product
      if product
        message = '购买' + product.name
      end
      user = order.user
      if order.agentuser_id != 0
        agent = User.find_by(order.agentuser_id)
        if agent
          user = agent
        end
      end
      if user.nickname.to_s.size > 1
        name = '*' + user.nickname.to_s[-2,2]
      elsif user.nickname.to_s.size > 0
        name = '*' + user.nickname.to_s[-1,1]
      else
        name = '*' + user.openid[-4,4]
      end
    elsif keyword == 'user'
      user = User.last
      name = '*' + user.openid[-4.4]
      message = '关注遇见玫好'
    else
      user = User.find(userid)
      if user.nickname.to_s.size > 1
        name = '*' + user.nickname.to_s[-2,2]
      elsif user.nickname.to_s.size > 0
        name = '*' + user.nickname.to_s[-1,1]
      else
        name = '*' + user.openid[-4,4]
      end
      agentlevel = user.agentlevel
      message = '成为' + agentlevel.name
    end
    Wxmessage.create(name:name, message:message)
    wxmessage = Wxmessage.all.order('id desc').paginate(:page => 1, :per_page => 20)
    ActionCable.server.broadcast 'wxmessage_channel',message:wxmessage.to_json
  end
end
