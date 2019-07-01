class ApplicationController < ActionController::Base

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

  def checkactive(activeproduct,openid) #productarr[product_id,number]
    productarr = Array.new
    activeproduct.each do |p|
      product = Product.find(p.product_id)
      productcla = Productclass.new
      productcla.id = product.id
      productcla.name = product.name
      productcla.cost = product.cost
      productcla.price = product.price
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
      productcla.optional = p.optional
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
    #productarr = limitactive(productarr)
    productarr = checkcollection(productarr,openid)
  end

  def send_template_msg(touser, template_id, url, topcolor, data) #发送模板消息
    $client ||= WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
    $client.send_temlate_msg(touser,template_id,url,topcolor,data)
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

  def limitactive(productarr)
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
