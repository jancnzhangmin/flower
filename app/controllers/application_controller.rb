class ApplicationController < ActionController::Base
  require 'net/http'
  class Productclass
    attr :id,true
    attr :name,true
    attr :cost,true
    attr :price,true
    attr :number,true
    attr :discount,true
    attr :activetype,true
    attr :firstprofit,true
    attr :secondprofit,true
    attr :owerprofit,true
    attr :producttype,true # 0原始商品 1活动商品
    attr :content,true
    attr :unit,true
    attr :spec,true
    attr :cover,true
    attr :images,true
    attr :subtitle,true
    attr :weight,true
    attr :brand,true
    attr :pack,true
    attr :season,true
    attr :collection,true
    attr :optional,true
    attr :agentprice,true
    attr :agentuserid,true
    attr :destock,true
    attr :isselect,true
    attr :shelflife,true
    attr :salecount,true
    attr :displaysale,true
    attr :trial,true
    attr :postage,true
    attr :addmoney,true
  end

  class Activetypeclass
    attr :active,true
    attr :showlable,true
    attr :summary,true
    attr :keywords,true
  end

  class Activeproductclass
    attr :product_id,true
    attr :number,true
    attr :optional,true
    attr :agentprice,true
  end

  class Addmoneyclass
    attr :buyproductids,true
    attr :buynumber,true
    attr :giveproductids,true
    attr :givenumber,true
    attr :amount,true
  end

  def checkactive(activeproduct,openid) #productarr[product_id,number]
    productarr = Array.new
    agent = User.find_by_openid(openid)
    agentlevel = agent.agentlevel
    activeproduct.each do |p|

      product = Product.find(p.product_id)
      productcla = Productclass.new
      productcla.id = product.id
      productcla.name = product.name
      productcla.cost = product.cost
      productcla.price = product.price
      productcla.agentprice = product.price
      if agentlevel
        productcla.agentprice = Agentprice.where('product_id = ? and agentlevel_id = ?',p.product_id,agentlevel.id).first.price
      end
      productcla.number = p.number
      productcla.firstprofit = 0
      productcla.secondprofit = 0
      productcla.owerprofit = 0
      productcla.discount = 0
      productcla.activetype = []
      productcla.producttype = 0
      productcla.content = product.content.html_safe
      productcla.unit = product.unit
      productcla.spec = product.spec
      productcla.shelflife = product.shelflife
      productcla.optional = p.optional
      productcla.isselect = 0
      productcla.displaysale = Config.first.displaysale
      productcla.salecount = product.salecount.to_i
      productcla.trial = product.trial.to_i
      productcla.postage = 0
      cover = product.productimgs.where('isdefault = 1')
      if cover.count > 0
        productcla.cover = cover.first.productimg.url
      end
      productimgs = product.productimgs
      productcla.images = []
      productimgs.each do |productimg|
        if productimg.isdefault.to_s != '1'
          productcla.images.push productimg.productimg.url
        end
      end
      productcla.subtitle = product.subtitle
      productcla.weight = product.weight
      productcla.brand = product.brand
      productcla.pack = product.pack
      productcla.season = product.season
      productarr.push productcla
    end
    #productarr = checksecond(productarr)
    #productarr = checkfirstbuy(productarr)
    #productarr = buyfullactive(productarr)
    productarr = mashupactive(productarr)
    productarr = limitactive(productarr,openid)
    productarr = checkaddmoneyactive(productarr)
    productarr = checkcollection(productarr,openid)
    productarr = multibuyfullactive(productarr)
  end

  def send_template_msg(touser, template_id, url, topcolor, data) #发送模板消息
    $client ||= WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
    $client.send_temlate_msg(touser,template_id,url,topcolor,data)
  end



  def sendvcode(phone,vcode)
    #phone=params[:phone]
    #vcode=randnumber
    require 'cgi'
    require 'digest/sha1'
    require 'base64'
    product = "Dysmsapi"
    domain = "dysmsapi.aliyuncs.com"
    accessKeyId = "LTAIAvikFGuaSwZc"
    accessKeySecret = "KgTGqXAGMS4NtSvlIkGrR03QW4bCQQ"
    codeparams={
        SignatureMethod:'HMAC-SHA1',
        SignatureNonce:SecureRandom.uuid,
        AccessKeyId:accessKeyId,
        SignatureVersion:'1.0',
        Timestamp:Time.now.gmtime.strftime('%Y-%m-%dT%H:%M:%SZ'),
        Format:'XML',
        Action:'SendSms',
        Version:'2017-05-25',
        RegionId:'cn-hangzhou',
        PhoneNumbers:phone,
        SignName:'花当家',
        TemplateParam:"{\"code\":\""+vcode+"\"}",
        TemplateCode:'SMS_171540182'
    }

    codeparams = "#{codeparams.sort.map { |k, v| CGI.escape("#{k}")+'='+CGI.escape("#{v}") }.join('&')}"
    stringToSign = 'GET&'
    stringToSign += CGI.escape('/')+'&'
    stringToSign += CGI.escape(codeparams)
    hmac = hmac_sha1(stringToSign,accessKeySecret+'&')
    signature = CGI.escape(hmac)
    url = 'http://dysmsapi.aliyuncs.com/?Signature='+hmac+'&'+codeparams
    ret_data = Net::HTTP.get(URI.parse(url))
    #render json: params[:callback]+'({"status":"1"})',content_type: "application/javascript"
  end

  def check_auth
    if !session[:login]
      redirect_to logins_path
    end
  end

  private

  def checkrediscache
    products = $rediscache.get('products')
    if products.nil?
      products.set('products',Product.all.to_json)
    end
  end

  def checksecond(productarr)
    productarr.each do |producta|
      secondactive = Secondactive.where("secondactives.long = 1 and status = 1")
      if secondactive.count == 0
        secondactive = Secondactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
        if secondactive.count == 0
          secondactive = []
        end
      end
      if secondactive.count > 0
        secondactive = secondactive.last
        secondactivedetails = secondactive.secondactivedetails
        secondactivedetails.each do |secondactivedetail|
          if producta.id == secondactivedetail.product_id
            producta.firstprofit = secondactive.firstprofit
            producta.secondprofit = secondactive.secondprofit
            activecla = Activetypeclass.new
            activecla.active = secondactive.name
            activecla.showlable = secondactive.showlable
            activecla.summary = secondactive.summary
            activecla.keywords = 'second'
            producta.activetype.push activecla
          end
        end
      end
    end
    productarr
  end

  def multibuyfullactive(productarr)
    multibuyfull = Multibuyfull.where('begintime <= ? and endtime >= ? and status = 1',Time.now, Time.now)
    if multibuyfull.size > 0
      multibuyfull = multibuyfull.first
      paysum = 0
      productarr.each do |p|
        if p.producttype == 0
          activecla = Activetypeclass.new
          activecla.active = multibuyfull.name
          activecla.showlable = multibuyfull.showlable
          activecla.summary = multibuyfull.summary
          activecla.keywords = 'multibuyfull'
          p.activetype.push activecla
        end
      end

    end
    productarr
  end

  def mashupactive(productarr)
    mashups = Mashup.where('begintime <= ? and endtime >= ? and status = 1', Time.now, Time.now)
    if mashups.size > 0
      mashups.each do |mashup|
        mashupbuyproducts = mashup.mashupbuyproducts
        mashupbuyproducts.each do |maspupbuyproduct|
          productarr.each do |p|
            if p.producttype == 0 && maspupbuyproduct.product.id == p.id && !p.activetype.map{|n| n.keywords}.include?('mashup')
              activecla = Activetypeclass.new
              activecla.active = mashup.name
              activecla.showlable = mashup.showlable
              activecla.summary = mashup.summary
              activecla.keywords = 'mashup'
              p.activetype.push activecla
            end
          end
        end
      end
    end
    productarr
  end

  def checkfirstbuy(productarr)
    firstbuyactive = Firstbuyactive.where("firstbuyactives.long = 1 and status = 1")
    if firstbuyactive.count == 0
      firstbuyactive = Firstbuyactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
    end
    if firstbuyactive.count > 0
      firstbuyactive = firstbuyactive.last
      firstbuyactivedetails = firstbuyactive.firstbuyactivedetails
      firstbuyactivedetails.each do |firstbuyactivedetail|
        numbercount = 0
        productarr.each do |p|
          if p.id == firstbuyactivedetail.product_id
            numbercount += p.number
          end
        end
        #if numbercount >= firstbuyactivedetail.number
        productarr.each do |p|
          if p.id == firstbuyactivedetail.product_id
            p.owerprofit = firstbuyactive.owerratio
            activecla = Activetypeclass.new
            activecla.active = firstbuyactive.name
            activecla.showlable = firstbuyactive.showlable
            replace_number = firstbuyactivedetail.number.to_i.to_s
            replace_unit = p.unit
            replace_discount = (p.price * p.owerprofit / 100 * firstbuyactivedetail.number).to_s
            activecla.summary = firstbuyactive.summary
            activecla.summary.sub!("{number}",replace_number)
            activecla.summary.sub!("{unit}",replace_unit)
            activecla.summary.sub!("{discount}",replace_discount)
            activecla.keywords = 'firstbuy'
            p.activetype.push activecla
          end
        end
        #end
      end
    end
    productarr
  end

  def buyfullactive(productarr)
    buyfullactive = Buyfullactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
    if buyfullactive.count > 0
      buyfullactive = buyfullactive.last
      buyfullactivedetails = buyfullactive.buyfullactivedetails
      buyfullactivedetails.each do |buyfullactivedetail|
        numbercount = 0
        has_give_product_id = Array.new
        productarr.each do |p|
          if p.id == buyfullactivedetail.product_id && p.producttype == 0
            numbercount += p.number
            activecla = Activetypeclass.new
            activecla.active = buyfullactive.name
            activecla.showlable = buyfullactive.showlable
            activecla.keywords = 'buyfull'
            activecla.summary = buyfullactive.summary
            giveproduct = Product.find(buyfullactivedetail.giveproduct_id)
            activecla.summary.sub!("{productname}",p.name)
            activecla.summary.sub!("{productnumber}",buyfullactivedetail.number.to_i.to_s)
            activecla.summary.sub!("{productunit}",p.unit)
            activecla.summary.sub!("{givename}",giveproduct.name)
            activecla.summary.sub!("{givenumber}",buyfullactivedetail.givenumber.to_i.to_s)
            activecla.summary.sub!("{giveunit}",giveproduct.unit)
            p.activetype.push activecla
          end
          has_give_product_id.push p.id
        end
        has_give_product_id.uniq!
        if numbercount >= buyfullactivedetail.number

          productarr.each do |p|
            if p.id == buyfullactivedetail.product_id
              if buyfullactivedetail.disableprofit == 1
                p.firstprofit = 0
                p.secondprofit = 0
              else
                p.firstprofit -= buyfullactivedetail.profitpercent
              end
              if buyfullactivedetail.disableowerprofit == 1
                p.owerprofit = 0
              else
                p.owerprofit -= buyfullactivedetail.owerprofitpercent
              end
            end
            if p.id == buyfullactivedetail.product_id && p.producttype == 0
              productcla = Productclass.new
              giveproduct = Product.find(buyfullactivedetail.giveproduct_id)
              productcla.id = giveproduct.id
              productcla.name = giveproduct.name
              productcla.cost = 0
              if buyfullactivedetail.intocost == 1
                productcla.cost = giveproduct.cost
              end
              productcla.price = 0
              productcla.number = (numbercount / buyfullactivedetail.number).to_i
              productcla.activetype = Array.new
              activecla = Activetypeclass.new
              activecla.active = buyfullactive.name
              activecla.showlable = buyfullactive.showlable
              activecla.keywords = 'buyfull'
              activecla.summary = buyfullactive.summary
              productcla.activetype.push activecla
              productcla.discount = giveproduct.price
              productcla.firstprofit = 0
              productcla.secondprofit = 0
              productcla.owerprofit = 0
              productcla.optional = []
              productcla.producttype = 1
              productcla.agentprice = 0
              productcla.unit = giveproduct.unit
              productcla.spec = giveproduct.spec
              productcla.subtitle = giveproduct.subtitle
              productcla.weight = giveproduct.weight
              productcla.brand = giveproduct.brand
              productcla.pack = giveproduct.pack
              productcla.season = giveproduct.season
              cover = giveproduct.productimgs.where('isdefault = 1')
              if cover.count > 0
                productcla.cover = cover.first.productimg.url
              end
              productcla.images = []
              giveimages = giveproduct.productimgs
              giveimages.each do |giveimage|
                if giveimage.isdefault != 1
                  productcla.images.push giveimage.productimg.url
                end
              end
              if productcla.number > 0 && has_give_product_id.include?(p.id)
                productarr.push productcla
                has_give_product_id.delete(p.id)
              end
            end

          end
        end
      end
    end
    productarr
  end

  def limitactive(productarr,openid)
    limitactive = Limitactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
    if limitactive.count > 0
      limitactive = limitactive.last
      limitactivedetails = limitactive.limitactivedetails
      limitactivedetails.each do |limitactivedetail|
        numbercount = 0
        productarr.each do |p|
          if p.id == limitactivedetail.product_id
            numbercount += p.number
          end
        end
        productarr.each do |p|
          if numbercount >= limitactivedetail.minnumber && p.id == limitactivedetail.product_id
            p.discount = p.price - limitactivedetail.price
            p.price = limitactivedetail.price
            user = User.find_by_openid(openid)
            agentlevel = user.agentlevel
            if agentlevel
              p.agentprice = Agentprice.where('product_id = ? and agentlevel_id = ?',p.id,agentlevel.id).first.price * limitactivedetail.discount.to_f
              p.discount = Agentprice.where('product_id = ? and agentlevel_id = ?',p.id,agentlevel.id).first.price - p.agentprice
            else
              p.agentprice = Product.find(p.id).price * limitactivedetail.discount.to_f
              p.discount = Product.find(p.id).price - p.agentprice
            end
            if limitactivedetail.disableprofit == 1
              p.firstprofit = 0
              p.secondprofit = 0
            else
              p.firstprofit -= limitactivedetail.profitpercent
              p.secondprofit -= limitactivedetail.profitpercent
            end
            if limitactivedetail.disableowerprofit == 1
              p.owerprofit = 0
            else
              p.owerprofit -= limitactivedetail.owerprofitpencent
            end
          end
          if p.id == limitactivedetail.product_id
            activetype = Activetypeclass.new
            activetype.active = limitactive.name
            activetype.showlable = limitactive.showlable
            activetype.keywords = 'limit'
            activetype.summary = limitactive.summary
            p.activetype.push activetype
          end
        end
      end
    end
    productarr
  end

  def checkaddmoneyactive(productarr) #检查加钱换购活动
    addmoney = Addmoneyactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
    if addmoney.size > 0
      addmoney = addmoney.first
      productarr.each do |p|
        if p.producttype == 0 && addmoney.addmoneybuyproducts.map{|n|n.product_id}.include?(p.id)
          activetype = Activetypeclass.new
          activetype.active = addmoney.name
          activetype.showlable = addmoney.showlable
          activetype.keywords = 'addmoney'
          activetype.summary = addmoney.summary
          p.activetype.push activetype
        end
      end
    end
    productarr
  end

  def checkcollection(productarr,openid)
    user = User.find_by_openid(openid)
    productarr.each do |p|
      collection = Collection.where('product_id = ? and user_id = ?',p.id,user.id)
      if collection.count > 0
        p.collection = 1
      else
        p.collection = 0
      end
    end
    productarr
  end

  def get_quarter(time) #获取季度信息
    nowtime = time.to_time
    year = nowtime.year
    month = nowtime.month
    quarter = '0'
    begintime = time
    endtime = time
    quarter1 = [1,2,3]
    quarter2 = [4,5,6]
    quarter3 = [7,8,9]
    if quarter1.include?(month)
      quarter = '01'
      begintime = (year.to_s + '-01-01 00:00:00').to_time
      endtime = (year.to_s + '-03-31 23:59:59').to_time
    elsif quarter2.include?(month)
      quarter = '02'
      begintime = (year.to_s + '-04-01 00:00:00').to_time
      endtime = (year.to_s + '-06-30 23:59:59').to_time
    elsif quarter3.include?(month)
      quarter = '03'
      begintime = (year.to_s + '-07-01 00:00:00').to_time
      endtime = (year.to_s + '-09-30 23:59:59').to_time
    else
      quarter = '04'
      begintime = (year.to_s + '-10-01 00:00:00').to_time
      endtime = (year.to_s + '-21-31 23:59:59').to_time
    end
    name = ''
    if quarter == '01'
      name = '一季度'
    elsif quarter == '02'
      name = '二季度'
    elsif quarter == '03'
      name = '三季度'
    else
      name = '四季度'
    end
    res = year.to_s + quarter + ',' + name + ',' + begintime.to_s + ',' + endtime.to_s
  end

  def get_agentprice(productarr,userid) #获取代理价格
    user = User.find(userid)
    productarr.each do |p|
      if p.producttype == 0
        p.agentprice = p.price
        if user
          agentlevel = user.agentlevel
          if agentlevel
            agentprice = Product.find(p.id).agentprices.where('agentlevel_id = ?',agentlevel.id).first.price
            p.agentprice = agentprice
          end
        end
      end
    end
  end

  def cablewxmessage(keyword,orderid,userid) #user 新增用户 order 用户购买 agent成为代理 userid只在keyword为agent时有效
    name = ''
    message = ''
    if keyword == 'order'
      order = Order.find(orderid)
      orderdetails = order.orderdetails
      localmsg = []
      orderdetails.each do |orderdetail|
        product = orderdetail.product
        lname = ''
        if product
          lname += product.name
        end
        orderoptionals = orderdetail.orderoptionals
        if orderoptionals.size > 0
          lname +='('
        end
        orderoptionals.each do |op|
          lname += op.selectcondition_name
        end
        if orderoptionals.size > 0
          lname += ')'
        end
        lname += '×' + orderdetail.number.to_i.to_s
        localmsg.push lname
      end
      message = '购买' + localmsg.join(' ')
      user = order.user
      if order.agentuser_id != 0
        agent = User.find_by(id:order.agentuser_id)
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

  def hmac_sha1(data, secret)
    require 'base64'
    require 'cgi'
    require 'openssl'
    hmac = CGI.escape(Base64.encode64("#{OpenSSL::HMAC.digest('sha1',secret, data)}").chomp)
    return hmac
  end


end
