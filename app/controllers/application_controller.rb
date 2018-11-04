class ApplicationController < ActionController::Base

  def checkactive(product,number,user)
    #买满送
    buyfullactive = Buyfullactive.where('begintime <= ? and endtime >= ?',Time.now,Time.now)
    if buyfullactive.count > 0
      buyfullactive = buyfullactive.first
      buyfullactivedetails = buyfullactive.buyfullactivedetails.where('product_id = ?',product)
    end
  end

  private


end
