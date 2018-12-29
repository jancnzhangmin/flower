class CreatebuycarJob < ApplicationJob
  queue_as :default

  def perform(productarr,openid)
    Buycar.transaction do
      user = User.find_by_openid(openid)
      buycars = user.buycars

      buycars.each do |buycar|
        buycar.destroy
      end
      JSON.parse(productarr).each do |p|
        buycar = user.buycars.create(product_id:p['id'], user_id:user.id, number:p['number'], price:p['price'], cost:p['cost'], discount:p['discount'], cover:p['cover'], firstprofit:p['firstprofit'], secondprofit:p['secondprofit'], owerprofit:p['owerprofit'], producttype:p['producttype'])
        p['optional'].each do |o|
          buycar.buycaroptionals.create(selectcondition_id:o['selectcondition_id'], selectcondition_name:o['selectcondition_name'])
        end
        # JSON.parse(optionalarr).each do |op|
        #   if op['product_id'] == p['id'] && p['producttype'] == 0
        #     buycar.buycaroptionals.create(selectcondition_id:op['selectcondition_id'], selectcondition_name:op['selectcondition_name'])
        #   end
        # end
        p['activetype'].each do |act|
          buycar.activetypes.create(active:act['active'], showlable:act['showlable'], summary:act['summary'], keywords:act['keywords'])
        end
      end

    end
  end
end
