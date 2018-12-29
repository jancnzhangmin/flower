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
    ############生成检查活动前数组
    productarr = Array.new
    JSON.parse(params[:data]).each do |p|
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

    productarr = checkactive(activeproductarr,params[:openid])
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

    ########写入购物车表

    CreatebuycarJob.perform_later(productarr.to_json,params[:openid])
    #CreatebuycarJob.set(wait: 1.minutes).perform_later(productarr.to_json,params[:openid])
    #   Buycar.transaction do
    #   user = User.find_by_openid(params[:openid])
    #   buycars = user.buycars
    #   buycars.each do |buycar|
    #     buycar.destroy
    #   end
    #   productarr.each do |p|
    #     buycar = user.buycars.create(product_id:p.id, user_id:user.id, number:p.number, price:p.price, cost:p.cost, discount:p.discount, cover:p.cover, firstprofit:p.firstprofit, secondprofit:p.secondprofit, owerprofit:p.owerprofit, producttype:p.producttype)
    #     optionalarr.each do |op|
    #       if op.product_id == p.id && p.producttype == 0
    #         buycar.buycaroptionals.create(selectcondition_id:op.selectcondition_id, selectcondition_name:op.selectcondition_name)
    #       end
    #     end
    #     p.activetype.each do |act|
    #       buycar.activetypes.create(active:act.active, showlable:act.showlable, summary:act.summary, keywords:act.keywords)
    #     end
    #   end
    # end

    # buycarproductarr_uniq = Array.new
    # localbuycararr.each do |arr|
    #   buycarproduct = Activeproductclass.new
    #   buycarproduct.product_id = arr.product_id
    #   buycarproduct.number = arr.number
    #   instatus = false
    #
    #   arr.selectcondition.each do |buy|
    #     if buy.product_id == buycarproduct.product_id
    #       buycarproduct.number += buy.number
    #       instatus = true
    #     end
    #   end
    #   if !instatus
    #
    #     buycarproductarr_uniq.push buycarproduct
    #   end
    # end

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

end
