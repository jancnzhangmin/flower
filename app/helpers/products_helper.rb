module ProductsHelper

  class Productclass
    attr :id,true
    attr :cost,true
    attr :price,true
    attr :activetype,true
    attr :firstprofit,true
    attr :secondprofit,true
    attr :owerprofit,true
  end

  class Activetype
    attr :name,true
    attr :status,true
  end

  def checkactive(product)
    productcla = Productclass.new
    productcla.id = product.id
    productcla.cost = product.cost
    productcla.price = product.price
    productcla.firstprofit = 0
    productcla.secondprofit = 0
    productcla.owerprofit = 0
    productcla.activetype = Array.new
    productcla = checkprofitactive(product,productcla)
    productcla = checkfirstbuy(product,productcla)
    productcla = checkbuyfullactive(product,productcla)
    productcla = checklimitactive(product,productcla)
    profit = product.price - product.cost
    productcla.firstprofit = productcla.firstprofit * profit / 100
    if productcla.firstprofit < 0
      productcla.firstprofit = 0
    end
    productcla.secondprofit = productcla.secondprofit * profit / 100
    if productcla.secondprofit < 0
      productcla.secondprofit = 0
    end
    productcla.owerprofit = productcla.owerprofit * profit / 100
    if productcla.owerprofit < 0
      productcla.owerprofit = 0
    end
    productcla.cost = productcla.cost + productcla.firstprofit + productcla.secondprofit + productcla.owerprofit
    productcla
  end

  private

  def checkprofitactive(product,productcla)

    secondactive = Secondactive.where("secondactives.long = 1 and status = 1")
    if secondactive.count == 0
      secondactive = Secondactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
      if secondactive.count == 0
        secondactive = []
      end
    end
    if secondactive.count > 0
      secondactive = secondactive.first
      secondactivedetails = secondactive.secondactivedetails
      if secondactivedetails.count > 0
        secondactivedetails.each do |secondactivedetail|
          if secondactivedetail.product_id == product.id
            productcla.firstprofit = secondactive.firstprofit
            productcla.secondprofit = secondactive.secondprofit
            productcla.activetype.push secondactive.name
          end
        end
      end
    end
    return productcla
  end

  def checkbuyfullactive(product,productcla)
    buyfullactive = Buyfullactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
    if buyfullactive.count > 0
      buyfullactive = buyfullactive.first
      buyfullactivedetails = buyfullactive.buyfullactivedetails
      buyfullactivedetails.each do |buyfullactivedetail|
        if buyfullactivedetail.product_id == product.id
          if buyfullactivedetail.disableprofit == 1
            productcla.firstprofit = 0
            productcla.secondprofit = 0
          else
            productcla.firstprofit -= buyfullactivedetail.profitpercent
            productcla.secondprofit -= buyfullactivedetail.profitpercent
          end
          if buyfullactivedetail.disableowerprofit == 1
            productcla.owerprofit = 0
          else
            productcla.owerprofit -=  buyfullactivedetail.owerprofitpercent
          end
          if buyfullactivedetail.intocost == 1
            productcla.cost = (buyfullactivedetail.number * product.cost + Product.find(buyfullactivedetail.giveproduct_id).cost * buyfullactivedetail.givenumber) / buyfullactivedetail.number
          end
          productcla.activetype.push buyfullactive.name
        end
      end
    end
    return productcla
  end

  def checklimitactive(product,productcla)
    limitactive = Limitactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
    if limitactive.count > 0
      limitactivedetails = limitactive.first.limitactivedetails
      limitactivedetails.each do |limitactiveetail|
        if limitactiveetail.product_id == product.id
          productcla.price = limitactiveetail.price
          if limitactiveetail.disableprofit > 0
            productcla.firstprofit = 0
            productcla.secondprofit = 0
          else
            productcla.firstprofit -= limitactiveetail.profitpercent
            productcla.secondprofit -= limitactiveetail.profitpercent
          end
          if limitactiveetail.disableowerprofit > 0
            productcla.owerprofit = 0
          else
            productcla.owerprofit -= limitactiveetail.owerprofitpencent
          end
          productcla.activetype.push limitactive.first.name
        end
      end
    end
    productcla
  end

  def checkfirstbuy(product,productcla)
    firstbuyactive = Firstbuyactive.where("firstbuyactives.long = 1 and status = 1")
    if firstbuyactive.count == 0
      firstbuyactive = Firstbuyactive.where('begintime <= ? and endtime >= ? and status = 1',Time.now,Time.now)
    end
    if firstbuyactive.count > 0
      firstbuyactivedetails = firstbuyactive.first.firstbuyactivedetails
      firstbuyactivedetails.each do |firstbuyactivedetail|
        if firstbuyactivedetail.product_id == product.id
          productcla.owerprofit = firstbuyactive.first.owerratio
          productcla.activetype.push firstbuyactive.first.name
        end
      end
    end
    productcla
  end

end
