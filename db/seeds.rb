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
  Config.create(appid:'wx0000000000000000',appsecret:'00000000000000000000000000000000',autocomment:'15',minbankamount:'100')
  puts '配置信息初始化成功'
end