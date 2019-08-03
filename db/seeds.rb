# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

config = Config.last
if config
  puts '配置信息已存在，忽略'
else 
  Config.create(appid:'wx0000000000000000',appsecret:'00000000000000000000000000000000',autocomment:'15',minbankamount:'100', displaysale:0)
  puts '配置信息初始化成功'
end

cla = Cla.find_by_keyword('recommend')
if cla
  puts '推荐商品分类已存在，忽略'
else
  cla = Cla.create(name:'推荐商品', keyword:'recommend', showinproduct:1)
  cla.order = cla.id
  cla.save
  puts '推荐商品分类初始化成功'
end

cla = Cla.find_by_keyword('star')
if cla
  puts '明星产品分类已存在，忽略'
else
  cla = Cla.create(name:'明星产品',keyword:'star')
  cla.order = cla.id
  cla.save
  puts '明星产品分类初始化成功'
end

cla = Cla.find_by_keyword('yjmh')
if cla
  puts '遇见玫好分类已存在，忽略'
else
  cla = Cla.create(name:'遇见玫好', keyword:'yjmh', showinproduct:1)
  cla.order = cla.id
  cla.save
  puts '遇见玫好分类初始化成功'
end

cla = Cla.find_by_keyword('azl')
if cla
  puts '啊咱哩分类已存在，忽略'
else
  cla = Cla.create(name:'啊咱哩', keyword:'azl', showinproduct:1)
  cla.order = cla.id
  cla.save
  puts '啊咱哩分类初始化成功'
end

cla = Cla.find_by_keyword('cysy')
if cla
  puts '茶言水语分类已存在，忽略'
else
  cla = Cla.create(name:'茶言水语', keyword:'cysy', showinproduct:1)
  cla.order = cla.id
  cla.save
  puts '茶言水语分类初始化成功'
end

cla = Cla.find_by_keyword('pec')
if cla
  puts '普洱茶分类已存在，忽略'
else
  cla = Cla.create(name:'普洱茶', keyword:'pec', showinproduct:1)
  cla.order = cla.id
  cla.save
  puts '普洱茶分类初始化成功'
end

cla = Cla.find_by_keyword('cpqm')
if cla
  puts '冲泡器皿分类已存在，忽略'
else
  cla = Cla.create(name:'冲泡器皿', keyword:'cpqm', showinproduct:1)
  cla.order = cla.id
  cla.save
  puts '冲泡器皿分类初始化成功'
end

cla = Cla.find_by_keyword('hctj')
if cla
  puts '好茶推荐分类已存在，忽略'
else
  cla = Cla.create(name:'好茶推荐', keyword:'hctj')
  cla.order = cla.id
  cla.save
  puts '好茶推荐分类初始化成功'
end

cla = Cla.find_by_keyword('czyh')
if cla
  puts '超值优惠分类已存在，忽略'
else
  cla = Cla.create(name:'超值优惠', keyword:'czyh')
  cla.order = cla.id
  cla.save
  puts '超值优惠分类初始化成功'
end

cla = Cla.find_by_keyword('cjtj')
if cla
  puts '茶具推荐分类已存在，忽略'
else
  cla = Cla.create(name:'茶具推荐', keyword:'cjtj')
  cla.order = cla.id
  cla.save
  puts '茶具推荐分类初始化成功'
end

products = Product.all
products.each do |product|
  if product.corder.to_i == 0
    product.corder = product.id
    product.save
  end
end

admin = Admin.find_by_login('admin')
if !admin
  Admin.create(login:'admin', name:'管理员', password:'admin', password_confirmation:'admin', status:1, servicename:'管理员')
  puts '管理员初始化成功'
end

