class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  class Optionalclass
    attr :id,true
    attr :name,true
    attr :condition,true
    attr :selectcondition_id,true
    attr :selectcondition_name,true
    attr :product_id,true
  end

  class Conditionclass
    attr :id,true
    attr :optional_id,true
    attr :name,true
    attr :weighting,true
  end

  def get_recommend_product #获取推荐产品列表
    products = Product.where('grounding = ? and addtop = ?',1,1).order('updated_at desc')
    productarr = Array.new
    products.each do |product|
      productcla = Activeproductclass.new
      productcla.product_id = product.id
      productcla.number = 1
      productarr.push productcla
    end
    productarr = checkactive(productarr,params[:openid])
    render json: params[:callback]+'({"products": ' + productarr.to_json + '})',content_type: "application/javascript"
  end

  def get_product_detail #获取产品明细
    product = Product.find(params[:product_id])
    productarr = Array.new
    productcla = Activeproductclass.new
    productcla.product_id = product.id
    productcla.number = 1
    productarr.push productcla
    productarr = checkactive(productarr,params[:openid])
    optionals = product.optionals
    optionalarr = []
    optionals.each do |optional|
      optionalcla = Optionalclass.new
      optionalcla.id = optional.id
      optionalcla.name = optional.name
      optionalcla.condition = []
      conditions = optional.conditions
      conditions.each do |condition|
        conditioncla = Conditionclass.new
        conditioncla.optional_id = condition.optional_id
        conditioncla.name = condition.name
        conditioncla.weighting = condition.weighting
        optionalcla.condition.push condition
      end
      optionalarr.push optionalcla
    end
    explains = product.explains
    freepost = Freepost.last
    user = User.find_by_openid(params[:openid])
    collection = Collection.where('user_id = ? and product_id = ?',user.id,product.id)
    if collection.count > 0
      collection = 1
    else
      collection = 0
    end
    render json: params[:callback]+'({"products": ' + productarr.to_json + ',"optionals":' + optionalarr.to_json + ',"explains":' + explains.to_json + ',"freepost":' + freepost.to_json + ',"collection":' + collection.to_s + '})',content_type: "application/javascript"
  end

  def collection #关注 取消关注
    status = 1
    if params[:product_id].to_i >0
      user = User.find_by_openid(params[:openid])
      #product = Product.find(params[:product_id])
      collection = Collection.where('user_id = ? and product_id = ?',user.id,params[:product_id])
      if collection.count > 0
        collection.first.destroy
      else
        Collection.create(user_id:user.id,product_id:params[:product_id])
      end
    end
    render json: params[:callback]+'({"status":' + status.to_s + '})',content_type: "application/javascript"
  end

  def force_collection #强制关注
    status = 1
    if params[:product_id].to_i > 0
      user = User.find_by_openid(params[:openid])
      #product = Product.find(params[:product_id])
      collection = Collection.where('user_id = ? and product_id = ?',user.id,params[:product_id])
      if collection.count == 0
        Collection.create(user_id:user.id,product_id:params[:product_id])
      end
    end
    render json: params[:callback]+'({"status":' + status.to_s + '})',content_type: "application/javascript"

  end

  class Localbuycarclass
    attr :product_id,true
    attr :number,true
    attr :selectoptional,true
  end

  class Localoptionalclass
    attr :selectcondition_id,true
    attr :selectcondition_name,true
  end

  def submitbuycar #提交购物车
    productarr = calactive(params[:data],params[:openid])
    ########写入购物车表
    CreatebuycarJob.perform_later(productarr.to_json,params[:openid])
    render json: '{"buycars":' + productarr.to_json + '}'
  end

  def get_amapkey #获取amapkey和默认收货地址统计
    user = User.find_by_openid(params[:openid])
    amapkey = Config.first.amapareakey
    receiptaddrcount = user.receiptaddrs.where('isdefault = 1').count
    render json: params[:callback]+'({"amapkey":"' + amapkey.to_s + '","receiptaddrcount":' + receiptaddrcount.to_s + '})',content_type: "application/javascript"
  end

  def set_address #保存或修改收货地址
    status = 1
    user = User.find_by_openid(params[:openid])
    if params[:isdefault].to_s == '1'
      receiptaddrs = user.receiptaddrs
      receiptaddrs.each do |f|
        f.isdefault = 0
        f.save
      end
    end
    if params[:formtype] == 'add'
      user.receiptaddrs.create(contact:params[:contact], contactphone:params[:contactphone], province:params[:province], city:params[:city], district:params[:district], street:params[:street], address:params[:address], isdefault:params[:isdefault], adcode:params[:adcode])
    else
      receiptaddr = Receiptaddr.find(params[:address_id])
      receiptaddr.contact = params[:contact]
      receiptaddr.contactphone = params[:contactphone]
      receiptaddr.province = params[:province]
      receiptaddr.city = params[:city]
      receiptaddr.district = params[:district]
      receiptaddr.street = params[:street]
      receiptaddr.address = params[:address]
      receiptaddr.isdefault = params[:isdefault]
      receiptaddr.adcode = params[:adcode]
      receiptaddr.save
    end

    receiptaddrs = user.receiptaddrs

    isdefault = receiptaddrs.where('isdefault = 1').count

    if isdefault == 0
      lastreceipt = receiptaddrs.last
      lastreceipt.isdefault = 1
      lastreceipt.save
    end

    render json: params[:callback]+'({"status":' + status.to_s + '})',content_type: "application/javascript"
  end

  def get_address_list #获取地址列表
    user = User.find_by_openid(params[:openid])
    receiptaddrs = user.receiptaddrs.order('isdefault desc')
    render json: params[:callback]+'({"receiptaddrs":' + receiptaddrs.to_json + '})',content_type: "application/javascript"
  end

  def get_address #获取单条地址信息
    receiptaddr = Receiptaddr.find(params[:address_id])
    render json: params[:callback]+'({"receiptaddr":' + receiptaddr.to_json + '})',content_type: "application/javascript"
  end

  def del_address #删除地址
    status = 1
    receiptaddr = Receiptaddr.find(params[:address_id])
    receiptaddr.destroy
    user = User.find_by_openid(params[:openid])
    receiptaddrs = user.receiptaddrs
    isdefault = receiptaddrs.where('isdefault = 1').count
    if isdefault == 0
      lastreceipt = receiptaddrs.last
      lastreceipt.isdefault = 1
      lastreceipt.save
    end
    render json: params[:callback]+'({"status":' + status.to_s + '})',content_type: "application/javascript"
  end

  def get_collection # 获取关注
    user = User.find_by_openid(params[:openid])
    collections = user.collections
    collections.each do |f|
      product = f.product
      if product && product.grounding == 0
        f.destroy
      end
    end
    productarr = Array.new
    collections = user.collections
    collections.each do |f|
      product = f.product
      if product
        productcla = Activeproductclass.new
        productcla.product_id = product.id
        productcla.number = 1
        productarr.push productcla
      end
    end
    collections = checkactive(productarr,params[:openid])
    collectioncount = collections.count
    render json: params[:callback]+'({"collections":' + collections.to_json + ',"collectioncount":' + collectioncount.to_s + '})',content_type: "application/javascript"
  end

  def get_class #获取分类列表
    clas = Cla.where('showinproduct = 1').order('clas.order')
    render json: params[:callback]+'({"clas":' + clas.to_json + '})',content_type: "application/javascript"
  end

  def get_product_list #获取产品列表
    products = Cla.find(params[:cla_id]).products
    productarr = Array.new
    products.each do |p|
      if p.grounding == 1
        productcla = Activeproductclass.new
        productcla.product_id = p.id
        productcla.number = 1
        productarr.push productcla
      end
    end
    products = checkactive(productarr,params[:openid])
    render json: params[:callback]+'({"products":' + products.to_json + '})',content_type: "application/javascript"
  end

  def get_appoint_address #获取指定地址
    receiptaddr = Receiptaddr.find(params[:address_id])
    render json: params[:callback]+'({"receiptaddr":' + receiptaddr.to_json + '})',content_type: "application/javascript"
  end

  def buycar_to_order #购物车转订单
    productarr = calactive(params[:data],params[:openid])
    price = 0
    productarr.each do |p|
      if p.producttype == 0
        price += p.price * p.number
      end
    end
    user = User.find_by_openid(params[:openid])
    balance = user.enaccounts.where('status = 1').sum('amount') - user.withdrawrecords.sum('amount')
    #balance = 300

    Order.transaction do
      user = User.find_by_openid(params[:openid])
      order = Order.find_by_frontuuid(params[:frontuuid])
      if order
        order.destroy
      end
      receiptaddr = Receiptaddr.find(params[:address_id])
      order = user.orders.create(ordernumber:Time.now.strftime('%Y%m%d') + user.id.to_s + Time.now.strftime('%H%M%S'),
                                 frontuuid:params[:frontuuid],
                                 payprice:price,
                                 paysum:price,
                                 province:receiptaddr.province,
                                 city:receiptaddr.city,
                                 district:receiptaddr.district,
                                 street:receiptaddr.street,
                                 adcode:receiptaddr.adcode,
                                 address:receiptaddr.address,
                                 contact:receiptaddr.contact,
                                 contactphone:receiptaddr.contactphone,
                                 receiptstatus:0,
                                 commentstatus:0,
                                 paystatus:0,
                                 status:1,
                                 deliverstatus:0,
                                 summary:params[:summary]
      )
      discount = 0
      owerprofit = 0
      productarr.each do |p|
        if p.producttype == 0
          discount += p.discount * p.number
          owerprofit += p.owerprofit * p.number
        end
        orderdetail = order.orderdetails.create(product_id:p.id, number:p.number, price:p.price, sum:p.number.to_f * p.price.to_f, producttype:p.producttype)
        p.optional.each do |o|
          orderdetail.orderoptionals.create(selectcondition_id:o[:selectcondition_id], selectcondition_name:o[:selectcondition_name])
        end
        p.activetype.each do |act|
          orderdetail.orderactivetypes.create(active:act.active, showlable:act.showlable, summary:act.summary, keywords:act.keywords)
        end
      end
      order.discount = discount
      order.owerprofit = owerprofit
      order.save
    end
    DeletebuycarJob.perform_later(user.id)
    render json: '{"price":"' + price.to_s + '","balance":"' + balance.to_s + '"}'
  end

  def get_unpay_list #获取未支付订单列表
    user = User.find_by_openid(params[:openid])
    orders = user.orders.where('paystatus = 0').paginate(:page => params[:page], :per_page => 10).order('id desc')
    orders.each do |order|
      productarr = []
      orderdetails = order.orderdetails
      orderdetails.each do |orderdetail|
        buycaroptional = []
        optionals = orderdetail.orderoptionals
        optionals.each do |op|
          op_params = {
              selectcondition_id:op.selectcondition_id,
              selectcondition_name:op.selectcondition_name
          }
          buycaroptional.push op_params
        end
        order_params = {
            id:orderdetail.id,
            product_id:orderdetail.product_id,
            number:orderdetail.number,
            buycaroptional:buycaroptional,
            producttype:orderdetail.producttype
        }
        productarr.push order_params
      end
      productarr = calactive(productarr.to_json,params[:openid])
      re_write_order(order.id,productarr)
    end
    orders = user.orders.where('paystatus = 0').paginate(:page => params[:page], :per_page => 10).order('id desc')

    productarr = []
    orders.each do |order|
      orderdetails = order.orderdetails
      orderdetailarr = []
      detailcount = 0
      orderdetails.each do |orderdetail|
        orderoptionals = orderdetail.orderoptionals
        optionalarr = []
        orderoptionals.each do |optional|
          optional_params = {
              id:optional.id,
              orderdetail_id:optional.orderdetail_id,
              selectcondition_id:optional.selectcondition_id,
              selectcondition_name:optional.selectcondition_name
          }
          optionalarr.push optional_params
        end

        orderactivetypes = orderdetail.orderactivetypes
        orderactivetypearr = []
        orderactivetypes.each do |active|
          active_params = {
              id:active.id,
              orderdetail_id:active.orderdetail_id,
              active:active.active,
              showlable:active.showlable,
              summary:active.summary,
              keywords:active.keywords
          }
          orderactivetypearr.push active_params
        end

        product = Product.find(orderdetail.product_id)
        cover = nil
        productimg = product.productimgs.where('isdefault = 1')
        if productimg.count > 0
          cover = productimg.first.productimg.url
        end
        orderdetail_params = {
            id:orderdetail.id,
            order_id:order.id,
            product_id:orderdetail.product_id,
            name:product.name,
            number:orderdetail.number,
            price:orderdetail.price,
            unit:product.unit,
            spec:product.spec,
            subtitle:product.subtitle,
            weight:product.weight,
            brand:product.brand,
            pack:product.pack,
            season:product.season,
            cover:cover,
            producttype:orderdetail.producttype,
            optional:optionalarr,
            active:orderactivetypearr
        }
        detailcount += orderdetail.number
        orderdetailarr.push orderdetail_params

      end
      params = {
          id:order.id,
          user_id:order.user_id,
          ordernumber:order.ordernumber,
          deduction:order.deduction,
          payprice:order.payprice,
          paysum:order.paysum,
          paystatus:order.paystatus,
          province:order.province,
          city:order.city,
          district:order.district,
          street:order.street,
          address:order.address,
          adcode:order.adcode,
          contact:order.contact,
          contactphone:order.contactphone,
          receiptstatus:order.receiptstatus,
          autoreceipttime:order.autoreceipttime,
          deliverstatus:order.deliverstatus,
          summary:order.summary,
          status:order.status,
          frontuuid:order.frontuuid,
          paytime:order.paytime,
          commentstatus:order.commentstatus,
          autocommenttime:order.autocommenttime,
          discount:order.discount,
          owerprofit:order.owerprofit,
          detailcount:detailcount,
          orderdetail:orderdetailarr
      }
      productarr.push params
    end

    render json: params[:callback] + '({"orders":' + productarr.to_json + ',"ordercount":' +productarr.count.to_s + '})',content_type: "application/javascript"
  end

  def pay #支付回调
    order = Order.find(params[:orderid])
    user = User.find(params[:openid])
    order.paystatus = 1
    order.paytime = Time.now
    order.save
    pay_process(order.id,user.id)
  end

  def pay_process(orderid,userid) #支付后操作
    order = Order.find(orderid)
    productarr = []
    orderdetails = order.orderdetails
    orderdetails.each do |orderdetail|
      buycaroptional = []
      optionals = orderdetail.orderoptionals
      optionals.each do |op|
        op_params = {
            selectcondition_id:op.selectcondition_id,
            selectcondition_name:op.selectcondition_name
        }
        buycaroptional.push op_params
      end
      order_params = {
          id:orderdetail.id,
          product_id:orderdetail.product_id,
          number:orderdetail.number,
          buycaroptional:buycaroptional,
          producttype:orderdetail.producttype
      }
      productarr.push order_params
      user = User.find(userid)
      productarr = calactive(productarr.to_json,user.openid)
      owerprofit = 0
      firstprofit = 0
      secondprofit = 0
      cost = 0
      price = 0
      productarr.each do |p|
        if p.producttype == 0
          owerprofit += p.owerprofit * p.number
          firstprofit += p.owerprofit * p.number
          secondprofit += p.secondprofit * p.number
          price += p.price * p.number
        end
        cost += p.cost * p.number
      end
      Profit.create(ordernumber:order.ordernumber,amount:price - cost,summary:'正常入账',status:0)
      firstuser = user.parent
      if firstuser
        if firstprofit > 0
          firstuser.enaccounts.create(order_id:order.id,amount:firstprofit,summary:'一级分润',status:0)
          Profit.create(ordernumber:order.ordernumber,amount:-firstprofit,summary:'一级分润',status:0)
        end
        seconduser = firstuser.parent
        if seconduser
          if secondprofit > 0
            seconduser.enaccounts.create(order_id:order.id,amount:seconduser,summary:'二级分润',status:0)
            Profit.create(ordernumber:order.ordernumber,amount:-seconduser,summary:'二级分润',status:0)
          end
        end
      end
      if owerprofit > 0
        user.enaccounts.create(order_id:order.id,amount:owerprofit,summary:'返现',status:0)
        Profit.create(ordernumber:order.ordernumber,amount:-owerprofit,summary:'返现',status:0)
      end


    end
  end

  def delete_order #删除订单
    status = 1
    order = Order.find(params[:orderid])
    if order && order.paystatus == 0
      order.destroy
    end
    render json: params[:callback]+'({"status":' + status.to_s + '})',content_type: "application/javascript"
  end

  def get_unpay_count #获取未支付订单数量
    ordercount = 0
    user = User.find_by_openid(params[:openid])
    ordercount = user.orders.where('paystatus = 0').count
    render json: params[:callback]+'({"ordercount":' + ordercount.to_s + '})',content_type: "application/javascript"
  end

  def get_unapyorder #获取未支付订单
    user = User.find_by_openid(params[:openid])
    balance = user.enaccounts.where('status = 1').sum('amount') - user.withdrawrecords.sum('amount')
    callback = params[:callback]
    order = Order.find(params[:orderid])
    productarr = []
    orderdetails = order.orderdetails
    orderdetails.each do |orderdetail|
      buycaroptional = []
      optionals = orderdetail.orderoptionals
      optionals.each do |op|
        op_params = {
            selectcondition_id:op.selectcondition_id,
            selectcondition_name:op.selectcondition_name
        }
        buycaroptional.push op_params
      end
      order_params = {
          id:orderdetail.id,
          product_id:orderdetail.product_id,
          number:orderdetail.number,
          buycaroptional:buycaroptional,
          producttype:orderdetail.producttype
      }
      productarr.push order_params
    end
    productarr = calactive(productarr.to_json,params[:openid])
    re_write_order(order.id,productarr)

    orderdetails = order.orderdetails
    orderdetailarr = []
    detailcount = 0
    orderdetails.each do |orderdetail|
      orderoptionals = orderdetail.orderoptionals
      optionalarr = []
      orderoptionals.each do |optional|
        optional_params = {
            id:optional.id,
            orderdetail_id:optional.orderdetail_id,
            selectcondition_id:optional.selectcondition_id,
            selectcondition_name:optional.selectcondition_name
        }
        optionalarr.push optional_params
      end

      orderactivetypes = orderdetail.orderactivetypes
      orderactivetypearr = []
      orderactivetypes.each do |active|
        active_params = {
            id:active.id,
            orderdetail_id:active.orderdetail_id,
            active:active.active,
            showlable:active.showlable,
            summary:active.summary,
            keywords:active.keywords
        }
        orderactivetypearr.push active_params
      end

      product = Product.find(orderdetail.product_id)
      cover = nil
      productimg = product.productimgs.where('isdefault = 1')
      if productimg.count > 0
        cover = productimg.first.productimg.url
      end
      orderdetail_params = {
          id:orderdetail.id,
          order_id:order.id,
          product_id:orderdetail.product_id,
          name:product.name,
          number:orderdetail.number,
          price:orderdetail.price,
          unit:product.unit,
          spec:product.spec,
          subtitle:product.subtitle,
          weight:product.weight,
          brand:product.brand,
          pack:product.pack,
          season:product.season,
          cover:cover,
          producttype:orderdetail.producttype,
          optional:optionalarr,
          active:orderactivetypearr
      }
      detailcount += orderdetail.number
      orderdetailarr.push orderdetail_params
    end

    params = {
        id:order.id,
        user_id:order.user_id,
        ordernumber:order.ordernumber,
        deduction:order.deduction,
        payprice:order.payprice,
        paysum:order.paysum,
        paystatus:order.paystatus,
        province:order.province,
        city:order.city,
        district:order.district,
        street:order.street,
        address:order.address,
        adcode:order.adcode,
        contact:order.contact,
        contactphone:order.contactphone,
        receiptstatus:order.receiptstatus,
        autoreceipttime:order.autoreceipttime,
        deliverstatus:order.deliverstatus,
        summary:order.summary,
        status:order.status,
        frontuuid:order.frontuuid,
        paytime:order.paytime,
        commentstatus:order.commentstatus,
        autocommenttime:order.autocommenttime,
        discount:order.discount,
        owerprofit:order.owerprofit,
        detailcount:detailcount,
        orderdetail:orderdetailarr
    }
    render json: callback + '({"order":' + params.to_json + ',"balance":' + balance.to_s + '})',content_type: "application/javascript"
  end

  def get_undeliver_list #获取待发货订单列表
    user = User.find_by_openid(params[:openid])
    orders = user.orders.where('paystatus = 1 and deliverstatus = 0').paginate(:page => params[:page], :per_page => 10).order('id desc')
    productarr = get_orders(orders)
    render json: params[:callback] + '({"orders":' + productarr.to_json + ',"ordercount":' +productarr.count.to_s + '})',content_type: "application/javascript"
  end

  def get_unreceipt_list #获取待收货订单列表
    user = User.find_by_openid(params[:openid])
    orders = user.orders.where('paystatus = 1 and deliverstatus = 1 and receiptstatus = 0').paginate(:page => params[:page], :per_page => 10).order('id desc')
    productarr = get_orders(orders)
    render json: params[:callback] + '({"orders":' + productarr.to_json + ',"ordercount":' +productarr.count.to_s + '})',content_type: "application/javascript"
  end

  def get_uncomment_list #获取待收货订单列表
    user = User.find_by_openid(params[:openid])
    orders = user.orders.where('paystatus = 1 and deliverstatus = 1 and receiptstatus = 1 and commentstatus = 0').paginate(:page => params[:page], :per_page => 10).order('id desc')
    productarr = get_orders(orders)
    render json: params[:callback] + '({"orders":' + productarr.to_json + ',"ordercount":' +productarr.count.to_s + '})',content_type: "application/javascript"
  end

  def get_undeliver_count #获取待发货订单数量
    user = User.find_by_openid(params[:openid])
    orderscount = user.orders.where('paystatus = 1 and deliverstatus = 0').count
    render json: params[:callback] + '({"ordercount":' +orderscount.to_s + '})',content_type: "application/javascript"
  end

  def get_unreceipt_count #获取待收货订单数量
    user = User.find_by_openid(params[:openid])
    orderscount = user.orders.where('paystatus = 1 and deliverstatus = 1 and receiptstatus = 0').count
    render json: params[:callback] + '({"ordercount":' +orderscount.to_s + '})',content_type: "application/javascript"
  end

  def get_uncomment_count #获取待收货订单数量
    user = User.find_by_openid(params[:openid])
    orderscount = user.orders.where('paystatus = 1 and deliverstatus = 1 and receiptstatus = 1 and commentstatus = 0').count
    render json: params[:callback] + '({"ordercount":' +orderscount.to_s + '})',content_type: "application/javascript"
  end

  def query_express #快递查询
    order = Order.find(params[:orderid])
    orderdelivers = order.orderdelivers
    queryarr =[]
    threadarr = []
    customer = Config.first.delivercustomer
    key = Config.first.deliverkey
    orderdelivers.each do |deliver|
      #param ="{\"com\":\"" + deliver.comcode + "\",\"num\":\"" + deliver.num + "\"}"
      param = '{"com":"' + deliver.comcode.to_s + '","num":"' + deliver.num + '"}'
      #sign = MD5.hexdigest(param + key + customer)
      #sign = Digest::MD5.new(param + key + customer).hexdigest
      sign = Digest::MD5.hexdigest(param + key + customer).upcase
      thread = Thread.new do
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
        option = {
            name:deliver.name,
            data:JSON.parse(request.body)
        }
        queryarr.push option
      end
      threadarr.push thread
    end
    threadarr.map(&:join)
    render json: params[:callback] + '({"express":' +queryarr.to_json + '})',content_type: "application/javascript"
  end

  def confirm_receipt #确认收货
    status  = 1
    AutoreceiptJob.perform_later(params[:orderid])
    render json: params[:callback] + '({"status":' + status.to_s + '})',content_type: "application/javascript"
  end

  def get_draft_comment #获取评价草稿
    user = User.find_by_openid(params[:openid])
    comment = Comment.where('user_id = ? and order_id = ?',user.id,params[:orderid])
    if comment.count > 0
      comment = comment.first
    else
      comment = Comment.create(user_id:user.id,order_id:params[:orderid],status:0)
    end
    commentimgs = comment.commentimgs
    commentimgarr = []
    commentimgs.each do |commentimg|
      param = {
          id:commentimg.id,
          image:commentimg.commentimg.url
      }
      commentimgarr.push param
    end
    render json: params[:callback] + '({"comment":' + comment.to_json + ',"images":' + commentimgarr.to_json + '})',content_type: "application/javascript"
  end

  def upload_commentimg #上传评论照片
    status = 1
    user = User.find_by_openid(params[:openid])
    comment = Comment.where('user_id = ? and order_id = ?',user.id,params[:orderid]).first
    comment.commentimgs.create(commentimg:params[:image])
    render json: '{"status":' + status.to_s + '}'
  end

  def delete_commentimg #删除评论照片
    status = 1
    commentimg = Commentimg.find(params[:commentimgid])
    commentimg.destroy
    render json: params[:callback] + '({"status":' + status.to_s + '})',content_type: "application/javascript"
  end

  def comment #评价
    status  = 0
    comment = Comment.find(params[:commentid])
    if comment
      comment.comment = params[:comment]
      comment.status = 1
      comment.commentlevel = params[:commentlevel]
      comment.descscore = params[:descscore]
      comment.deliverscore = params[:deliverscore]
      comment.servicescore = params[:servicescore]
      comment.anonymous = params[:anonymous]
      comment.save
      status = 1
      order = comment.order
      order.autocommenttime = Time.now
      order.commentstatus = 1
      order.save
    end
    render json: params[:callback] + '({"status":' + status.to_s + '})',content_type: "application/javascript"
  end

  def get_search #获取查询产品列表
    products = Product.where('grounding = 1 and (name like ? or pinyin like ? or fullpinyin like ?)',"%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%")
    productarr = Array.new
    products.each do |product|
      cover = product.productimgs.where('isdefault = 1')
      if cover.count > 0
        cover = cover.first.productimg.url
      end
      param = {
          id:product.id,
          name:product.name,
          price:product.price,
          unit:product.unit,
          spec:product.spec,
          pinyin:product.pinyin,
          fullpinyin:product.fullpinyin,
          subtitle:product.subtitle,
          cover:cover
      }
      productarr.push param
    end

    render json: params[:callback]+'({"products": ' + productarr.to_json + '})',content_type: "application/javascript"
  end

  private

  def get_orders(orders) #获取订单
    productarr = []
    orders.each do |order|
      orderdetails = order.orderdetails
      orderdetailarr = []
      detailcount = 0
      orderdetails.each do |orderdetail|
        orderoptionals = orderdetail.orderoptionals
        optionalarr = []
        orderoptionals.each do |optional|
          optional_params = {
              id:optional.id,
              orderdetail_id:optional.orderdetail_id,
              selectcondition_id:optional.selectcondition_id,
              selectcondition_name:optional.selectcondition_name
          }
          optionalarr.push optional_params
        end

        orderactivetypes = orderdetail.orderactivetypes
        orderactivetypearr = []
        orderactivetypes.each do |active|
          active_params = {
              id:active.id,
              orderdetail_id:active.orderdetail_id,
              active:active.active,
              showlable:active.showlable,
              summary:active.summary,
              keywords:active.keywords
          }
          orderactivetypearr.push active_params
        end

        product = Product.find(orderdetail.product_id)
        cover = nil
        productimg = product.productimgs.where('isdefault = 1')
        if productimg.count > 0
          cover = productimg.first.productimg.url
        end
        orderdetail_params = {
            id:orderdetail.id,
            order_id:order.id,
            product_id:orderdetail.product_id,
            name:product.name,
            number:orderdetail.number,
            price:orderdetail.price,
            unit:product.unit,
            spec:product.spec,
            subtitle:product.subtitle,
            weight:product.weight,
            brand:product.brand,
            pack:product.pack,
            season:product.season,
            cover:cover,
            producttype:orderdetail.producttype,
            optional:optionalarr,
            active:orderactivetypearr
        }
        detailcount += orderdetail.number
        orderdetailarr.push orderdetail_params

      end
      params = {
          id:order.id,
          user_id:order.user_id,
          ordernumber:order.ordernumber,
          deduction:order.deduction,
          payprice:order.payprice,
          paysum:order.paysum,
          paystatus:order.paystatus,
          province:order.province,
          city:order.city,
          district:order.district,
          street:order.street,
          address:order.address,
          adcode:order.adcode,
          contact:order.contact,
          contactphone:order.contactphone,
          receiptstatus:order.receiptstatus,
          autoreceipttime:order.autoreceipttime,
          deliverstatus:order.deliverstatus,
          summary:order.summary,
          status:order.status,
          frontuuid:order.frontuuid,
          paytime:order.paytime,
          commentstatus:order.commentstatus,
          autocommenttime:order.autocommenttime,
          discount:order.discount,
          owerprofit:order.owerprofit,
          detailcount:detailcount,
          orderdetail:orderdetailarr
      }
      productarr.push params
    end
    productarr
  end

  def re_write_order(orderid,productarr) #重新计算未支付订单
    Order.transaction do
      order = Order.find(orderid)
      orderdetails = order.orderdetails
      orderdetails.each do |orderdetail|
        orderdetail.destroy
      end
      price = 0
      discount = 0
      owerprofit = 0
      productarr.each do |p|
        if p.producttype == 0
          price += p.price * p.number
          discount += p.discount * p.number
          owerprofit += p.owerprofit * p.number
        end
        orderdetail = order.orderdetails.create(product_id:p.id, number:p.number, price:p.price, sum:p.number.to_f * p.price.to_f, producttype:p.producttype)
        p.optional.each do |o|
          orderdetail.orderoptionals.create(selectcondition_id:o[:selectcondition_id], selectcondition_name:o[:selectcondition_name])
        end
        p.activetype.each do |act|
          orderdetail.orderactivetypes.create(active:act.active, showlable:act.showlable, summary:act.summary, keywords:act.keywords)
        end
      end
      order.paysum = price
      order.discount = discount
      order.owerprofit = owerprofit
      order.save
    end
  end

  def calactive(paramsdata,paramsopenid) #计算活动
    ############生成检查活动前数组
    productarr = Array.new
    JSON.parse(paramsdata).each do |p|
      parr = Array.new
      parr.push p['product_id']
      parr.push p['number']
      optionanarr = Array.new
      p['buycaroptional'].each do |optional|
        optionanarr.push optional['selectcondition_id']
      end
      parr.push optionanarr
      if p['producttype'] == 0
        productarr.push parr
      end
    end
    ##############数组去重
    mereproduct = Array.new
    productarr.each do |arr|
      product_num = 0
      productarr.each do |localarr|
        if localarr[0] == arr[0] && localarr[2..localarr.count - 1] == arr[2..arr.count - 1]
          product_num += localarr[1]
        end
      end
      instatus = false
      mereproduct.each do |m|
        if m[0] == arr[0] && arr[2..arr.count - 1] == m[2..m.count - 1]
          instatus = true
        end
      end
      if !instatus
        arr[1] = product_num
        if arr[1] > 0
          mereproduct.push arr
        end
      end
    end

    activeproductarr = Array.new
    mereproduct.each do |m|
      activeproductcla = Activeproductclass.new
      activeproductcla.product_id = m[0]
      activeproductcla.number = m[1]
      activeproductcla.optional = m[2]
      activeproductarr.push activeproductcla
    end

    productarr = checkactive(activeproductarr,paramsopenid)
    productarr.each do |p|
      oparr = Array.new
      weighting = 0
      p.optional.each do |o|
        condition = Condition.find(o)
        weighting += condition.weighting
        op_params = {
            selectcondition_id:condition.id,
            selectcondition_name:condition.name
        }
        oparr.push op_params
      end
      p.optional = oparr
      p.price += weighting
    end
  end

end
