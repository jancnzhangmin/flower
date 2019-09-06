class AfterpayJob < ApplicationJob
  queue_as :default

  def perform(mergepayorderid)
    mergepayorder = Mergepayorder.find(mergepayorderid)
    orderids = mergepayorder.orderids.split(',')
    orderids.each do |orderid|
      order = Order.find(orderid)
      bodyarr = []
      pushorderbodyarr = []

      orderdetails = order.orderdetails
      pushorderbody = ''
      orderdetails.each do |orderdetail|
        product = orderdetail.product
        if product
          product.salecount = product.salecount.to_f + orderdetail.number
          product.save
          bodyarr.push product.name

          ###########公司推单消息############
          pushorderbody = ''
          pushorderbody += product.name
          if orderdetail.orderoptionals.size > 0
            pushorderbody += '(' + orderdetail.orderoptionals.map{|n| n.selectcondition_name}.join(' ') + ')'
          end
          pushorderbody += '×' + orderdetail.number.to_i.to_s
          if orderdetail.producttype == 1 && orderdetail.orderactivetypes.size > 0
            pushorderbody += '(注：' + orderdetail.orderactivetypes.map{|n| n.active}.join(' ') + ')'
          end
          pushorderbodyarr.push pushorderbody
          ##########公司推单消息结束##########
        end
      end
      pbody = '收件人姓名：' + order.contact + '<br>'+ '收件人电话：' + order.contactphone + '<br>' + '收件人地址：' + order.province + order.city + order.district + order.address
      pbody += '<br>货品及数量：' + pushorderbodyarr.join(' ')

      if order.summary.to_s.size > 0
        pbody += '<br>备注：' + order.summary
      end
      Pushorder.create(ordernumber:order.ordernumber, content:pbody)
      body = bodyarr.join(' ')
      if body.size > 120
        body = body[0..120] + '...'
      end
      agent = User.find_by(id:order.agentuser_id)
      if agent
        p_task(agent,order,order.destock)
        p_enaccount(agent,agent,order,order.destock)
        p_agentpayment(agent,order)
      else
        user = order.user
        p_task(user,order,order.destock)
        p_enaccount(user,user,order,order.destock)
        p_agentpayment(user,order)
      end
      msgtitle = Time.now.strftime('%Y-%m-%d %H:%M:%S') + '(第' + Order.where('paystatus = 1 and paytime between ? and ?',Time.now.beginning_of_day,Time.now.end_of_day).size.to_s + '单)'
      data={
          "first": {
          "value":msgtitle,
          "color":"#173177"
      },
          "keyword1":{
          "value":order.ordernumber
      },
          "keyword2":{
          "value":order.paytime.strftime('%Y-%m-%d %H:%M:%S')
      },
          "keyword3": {
          "value":body
      },
          "keyword4": {
          "value":'(' + order.contact + order.contactphone + ')' + order.province + order.city + order.district + order.address
      },
          "remark":{
          "value": '订单金额：￥' + order.paysum.to_s + '元 '
      }
      }
      users = User.all
      users.each do |us|
        if us.receiveneworder == 1
          SendtemplatemsgJob.perform_later(us.openid,'ZFIMzBxU_91cbDh5QjutyK3_bI4hWVuC0tYnmVaVUZ8','http://flower.ysdsoft.com/getopenids','#173177',data)
        end
      end
      AutoreceiptJob.set(wait: Config.first.autoreceipt.days).perform_later(order.id)
    end
  end

  private

  def direct_agent(agent,order)
    parent = agent.parent
    quarter = get_quarter(Time.now)
    agentlevel = agent.agentlevel
    task = 0
    agentlevelname = ''
    if agentlevel
      task = agentlevel.task
      agentlevelname = agentlevel.name
    end
    examination = agent.examinations.where('keyword = ?',quarter.split(',')[0])
    if examination.size == 0
      examination = agent.examinations.create(keyword:quarter.split(',')[0], name:quarter.split(',')[1], begintime:quarter.split(',')[2], endtime:quarter.split(',')[3], agentlevel:agentlevelname, task:task)
    else
      examination = examination.first
    end
    parentagentlevel = parent.agentlevel
    orderdetails = order.orderdetails
    orderdetails.each do |orderdetail|
      if orderdetail.producttype == 0
        product = orderdetail.product
        agent.agentpaymentrecorders.create(agentpayment:-orderdetail.sum, paymenttime:Time.now, summary:product.name.to_s + '*' + orderdetail.number.to_i.to_s) #处理货款
        if product.intask == 1
          opname = []
          orderoptionals = orderdetail.orderoptionals
          orderoptionals.each do |op|
            opname.push op.selectcondition_name
          end
          opname = opname.join(' ')
          if opname.size > 0
            opname = '(' + opname + ')'
          end
          examination.examinationdetails.create(amount:orderdetail.sum, productname:product.name + opname, productnumber:orderdetail.number, examintype:0) #处理任务
        end
      end
      if parentagentlevel
        parentagentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',parentagentlevel.id,product.id).first.price
        agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,product.id).first.price
        difference = (agentprice - parentagentprice) * orderdetail.number
        if difference > 0
          parent.enaccounts.create(amount:difference, order_id:order.id, summary:agent.nickname.to_s + '(' + agent.name.to_s + ') ' + product.name + '*' + orderdetail.number.to_i.to_s, status:1)
        end
      end

    end
  end

  def p_agentpayment(user,order) #处理货款
    if user.agentpayment.to_f >= order.paysum
      orderdetails = order.orderdetails
      orderdetails.each do |orderdetail|
        product = orderdetail.product
        user.agentpaymentrecorders.create(agentpayment:-orderdetail.sum, paymenttime:Time.now, summary:product.name.to_s + '*' + orderdetail.number.to_i.to_s)
      end
    end
  end

  def p_single_task(user,order) #处理单任务
    quarter = get_quarter(Time.now)
    examination = user.examinations.where('keyword = ?',quarter.split(',')[0])
    if examination.size == 0
      examination = agent.examinations.create(keyword:quarter.split(',')[0], name:quarter.split(',')[1], begintime:quarter.split(',')[2], endtime:quarter.split(',')[3], agentlevel:agentlevelname, task:task)
    else
      examination = examination.first
    end
    orderdetails = order.orderdetails
    orderdetails.each do |orderdetail|
      product = orderdetail.product
      if product && product.intask == 1 && orderdetail.producttype == 0
        opname = []
        orderoptionals = orderdetail.orderoptionals
        orderoptionals.each do |op|
          opname.push op.selectcondition_name
        end
        opname = opname.join(' ')
        if opname.size > 0
          opname = '(' + opname + ')'
        end
        agentlevel = user.agentlevel
        agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,product.id).first
        examination.examinationdetails.create(amount:-agentprice * orderdetail.number, productname:product.name + opname, productnumber:orderdetail.number, examintype:0) #处理任务
      end
    end
  end

  def p_multi_task(user,order) #处理多任务
    agentlevel = user.agentlevel
    if agentlevel
      p_single_task(user,order)
    end
    parent = user.parent
    if parent
      p_multi_task(parent,order)
    end
  end



  def p_destock_agent_enaccount(parent,user,order) #处理代理去库存收入 destock==1 agenuser_id != 0
    parentagentlevel = parent.agentlevel
    agentlevel = user.agentlevel
    orderdetails = order.orderdetails
    orderdetails.each do |orderdetail|
      product = orderdetail.product
      if product
        parentagentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',parentagentlevel.id,product.id).first.price
        agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,product.id).first.price
        difference = (agentprice - parentagentprice) * orderdetail.number
        if difference > 0
          parent.enaccounts.create(amount:difference, order_id:order.id, summary:user.nickname.to_s + '(' + user.name.to_s + ') ' + product.name + '*' + orderdetail.number.to_i.to_s, status:1)
        end
      end
    end
  end



  def p_task(user,order,destock) #处理任务
    agentlevel = user.agentlevel
    agentlevelname = ''
    task = 0
    if agentlevel
      agentlevelname = agentlevel.name
      task = agentlevel.task
    end
    quarter = get_quarter(Time.now)
    examination = user.examinations.where('keyword = ?',quarter.split(',')[0])
    if examination.size == 0
      examination = user.examinations.create(keyword:quarter.split(',')[0], name:quarter.split(',')[1], begintime:quarter.split(',')[2], endtime:quarter.split(',')[3], agentlevel:agentlevelname, task:task)
    else
      examination = examination.first
    end
    orderdetails = order.orderdetails
    orderdetails.each do |orderdetail|
      product = orderdetail.product
      if product && orderdetail.producttype == 0 && product.intask == 1
        agentprice = orderdetail.price
        if agentlevel
          agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,product.id).first.price
        end
        opname = []
        weighting = []
        orderoptionals = orderdetail.orderoptionals
        orderoptionals.each do |op|
          opname.push op.selectcondition_name
          weighting.push Condition.find(op.selectcondition_id).weighting.to_f
        end
        opname = opname.join(' ')
        if opname.size > 0
          opname = '(' + opname + ')'
        end
        weighting = weighting.sum * orderdetail.number
        examination.examinationdetails.create(amount:agentprice * orderdetail.number + weighting, productname:product.name + opname, productnumber:orderdetail.number, examintype:0) #处理任务
      end
    end
    parent = user.parent
    if parent && destock == 0
      p_task(parent,order,destock)
    end
  end

  def check_agentlevel(user) #检查用户是否是代理
    res = nil
    parent = user.parent
    if parent
      agentlevel = parent.agentlevel
      if !agentlevel
        check_agentlevel(parent)
      else
        res = parent
      end
    end
    res
  end

  def p_enaccount(parent,user,order,destock) #处理收入
    parent = check_agentlevel(parent)
    if parent
      parentagentlevel = parent.agentlevel
      agentlevel = user.agentlevel
      orderdetails = order.orderdetails
      orderdetails.each do |orderdetail|
        product = orderdetail.product
        if product && orderdetail.producttype == 0 && parentagentlevel
          diffprice = 0
          if parent.agentpayment.to_f >= order.paysum && !agentlevel
            diffprice = orderdetail.price * orderdetail.number
          elsif parent.agentpayment.to_f >= order.paysum && agentlevel
            parentagentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',parentagentlevel.id,product.id).first.price
            agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,product.id).first.price
            diffprice = (agentprice - parentagentprice) * orderdetail.number
          elsif  parent.agentpayment.to_f < order.paysum && !agentlevel
            parentagentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',parentagentlevel.id,product.id).first.price
            diffprice = (product.price - parentagentprice) * orderdetail.number
          else
            parentagentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',parentagentlevel.id,product.id).first.price
            agentprice = Agentprice.where('agentlevel_id = ? and product_id = ?',agentlevel.id,product.id).first.price
            diffprice = (agentprice - parentagentprice) * orderdetail.number
          end
          if diffprice > 0
            parent.enaccounts.create(amount:diffprice, order_id:order.id, summary:user.nickname.to_s + '(' + user.name.to_s + ') ' + product.name + ' ×' + orderdetail.number.to_i.to_s, status:1)
          end
        end
      end
      if destock == 0 && parent
        p_enaccount(parent,parent,order,destock)
      end
    end
  end


end
