class ApiController < ApplicationController

  class Productclass
    attr :id,true
    attr :name,true
    attr :cost,true
    attr :price,true
    attr :content,true
    attr :grounding,true
    attr :unit,true
    attr :spec,true
    attr :pinyin,true
    attr :fullpinyin,true
    attr :addtop,true
    attr :subtitle,true
    attr :cover,true
  end

  class Optionalclass
    attr :id,true
    attr :name,true
    attr :condition,true
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

end
