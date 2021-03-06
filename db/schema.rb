# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_03_033719) do

  create_table "activecolors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "frontcolor"
    t.string "shadowcolor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activetypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "buycar_id"
    t.string "active"
    t.integer "showlable"
    t.string "summary"
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addmoneyactives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "buynumber"
    t.integer "givenumber"
    t.datetime "begintime"
    t.datetime "endtime"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "amount"
    t.integer "showlable"
    t.string "summary"
  end

  create_table "addmoneybuyproducts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "addmoneyactive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addmoneygiveproducts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "addmoneyactive_id"
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "login"
    t.string "name"
    t.string "password_digest"
    t.integer "status"
    t.string "servicename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agentcertificates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agentcertificate_file_name"
    t.string "agentcertificate_content_type"
    t.bigint "agentcertificate_file_size"
    t.datetime "agentcertificate_updated_at"
    t.bigint "agent_id"
  end

  create_table "agentlevels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "corder"
    t.integer "grant"
    t.float "amount"
    t.float "task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "deposit"
    t.integer "frontend"
  end

  create_table "agentpaymentrecorders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.float "agentpayment"
    t.string "summary"
    t.datetime "paymenttime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agentprices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "agentlevel_id"
    t.bigint "product_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.float "agentpayment"
    t.string "phone"
    t.integer "showphone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "autoupgrade"
    t.integer "examination"
  end

  create_table "bankdefs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "bank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "bankdef_id"
    t.bigint "user_id"
    t.string "account"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buycaroptionals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "buycar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "selectcondition_id"
    t.string "selectcondition_name"
  end

  create_table "buycars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.float "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.float "cost"
    t.float "discount"
    t.string "cover"
    t.float "firstprofit"
    t.float "secondprofit"
    t.float "owerprofit"
    t.integer "producttype"
    t.bigint "agentuser_id"
    t.integer "destock"
    t.float "agentprice"
    t.integer "isselect"
    t.integer "trial"
  end

  create_table "buyfullactivedetails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "buyfullactive_id"
    t.float "number"
    t.bigint "giveproduct_id"
    t.float "givenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "disableprofit"
    t.float "profitpercent"
    t.integer "disableowerprofit"
    t.float "owerprofitpercent"
    t.integer "intocost"
  end

  create_table "buyfullactives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "begintime"
    t.datetime "endtime"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "showlable"
    t.string "summary"
  end

  create_table "citycoordinates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "province"
    t.string "city"
    t.decimal "lng", precision: 15, scale: 12
    t.decimal "lat", precision: 15, scale: 12
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "keyword"
    t.integer "showinproduct"
  end

  create_table "clas_products", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cla_id", null: false
    t.bigint "product_id", null: false
  end

  create_table "collections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commentimgs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commentimg_file_name"
    t.string "commentimg_content_type"
    t.bigint "commentimg_file_size"
    t.datetime "commentimg_updated_at"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.text "comment"
    t.bigint "up_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.integer "status"
    t.integer "commentlevel"
    t.integer "anonymous"
    t.float "descscore"
    t.float "deliverscore"
    t.float "servicescore"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "optional_id"
    t.string "name"
    t.float "weighting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "conditionimg_file_name"
    t.string "conditionimg_content_type"
    t.bigint "conditionimg_file_size"
    t.datetime "conditionimg_updated_at"
  end

  create_table "configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "appid"
    t.string "appsecret"
    t.float "autocomment"
    t.float "minbankamount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "amapareakey"
    t.float "autoreceipt"
    t.string "deliverkey"
    t.string "delivercustomer"
    t.string "qrdemo_file_name"
    t.string "qrdemo_content_type"
    t.bigint "qrdemo_file_size"
    t.datetime "qrdemo_updated_at"
    t.string "headdemo_file_name"
    t.string "headdemo_content_type"
    t.bigint "headdemo_file_size"
    t.datetime "headdemo_updated_at"
    t.integer "displaysale"
  end

  create_table "currentexaminations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "examination_id"
    t.integer "currentexamination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivercodes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "comcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enaccounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.float "amount"
    t.string "summary"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examinationdetails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "examination_id"
    t.float "amount"
    t.string "productname"
    t.float "productnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "examintype"
  end

  create_table "examinations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "begintime"
    t.datetime "endtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "keyword"
    t.string "agentlevel"
    t.float "task"
  end

  create_table "explains", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "explains_products", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "explain_id", null: false
    t.bigint "product_id", null: false
  end

  create_table "firstbuyactivedetails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "firstbuyactive_id"
    t.float "number"
    t.float "owerprofit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "firstbuyactives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "begintime"
    t.datetime "endtime"
    t.integer "long"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "owerratio"
    t.integer "showlable"
    t.string "summary"
  end

  create_table "freeposts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "limitactivedetails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "limitactive_id"
    t.float "price"
    t.float "minnumber"
    t.float "limitnumber"
    t.integer "disableprofit"
    t.float "profitpercent"
    t.integer "disableowerprofit"
    t.float "owerprofitpencent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "discount"
  end

  create_table "limitactives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "begintime"
    t.datetime "endtime"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "showlable"
    t.string "summary"
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "contactphone"
    t.string "address"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mashupbuyproducts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "mashup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mashups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "showlable"
    t.string "summary"
    t.string "keywords"
    t.integer "buynumber"
    t.bigint "giveproduct_id"
    t.integer "status"
    t.datetime "begintime"
    t.datetime "endtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mergepayorders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ordernumber"
    t.string "orderids"
    t.integer "paystatus"
    t.datetime "paytime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "wxpaysum"
    t.string "sign"
  end

  create_table "multibuyfullbuyproducts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "multibuyfull_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multibuyfullgiveproducts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "multibuyfull_id"
    t.bigint "product_id"
    t.float "buyprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multibuyfulls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "begintime"
    t.datetime "endtime"
    t.integer "status"
    t.integer "showlable"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optionals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "optionalimg_file_name"
    t.string "optionalimg_content_type"
    t.bigint "optionalimg_file_size"
    t.datetime "optionalimg_updated_at"
  end

  create_table "orderactivetypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "orderdetail_id"
    t.string "active"
    t.integer "showlable"
    t.string "summary"
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orderdelivers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id"
    t.string "name"
    t.string "comcode"
    t.string "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.text "message"
  end

  create_table "orderdetails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.float "number"
    t.float "price"
    t.float "sum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "optional"
    t.integer "producttype"
    t.string "summary"
  end

  create_table "orderoptionals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "orderdetail_id"
    t.bigint "selectcondition_id"
    t.string "selectcondition_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ordernumber"
    t.float "deduction"
    t.float "payprice"
    t.float "paysum"
    t.integer "paystatus"
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.string "contact"
    t.string "contactphone"
    t.integer "receiptstatus"
    t.datetime "autoreceipttime"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street"
    t.string "adcode"
    t.integer "status"
    t.string "frontuuid"
    t.datetime "paytime"
    t.integer "commentstatus"
    t.datetime "autocommenttime"
    t.float "owerprofit"
    t.float "discount"
    t.integer "deliverstatus"
    t.integer "destock"
    t.bigint "agentuser_id"
    t.float "postage"
  end

  create_table "owerstayincomes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ordernumber"
    t.integer "incomestatus"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postagerules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.float "startpostage"
    t.float "ordernumber"
    t.float "endpostage"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postareas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "postagerule_id"
    t.string "adcode"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productimgs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "isdefault"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "productimg_file_name"
    t.string "productimg_content_type"
    t.bigint "productimg_file_size"
    t.datetime "productimg_updated_at"
  end

  create_table "productqrs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "productqrbase_file_name"
    t.string "productqrbase_content_type"
    t.bigint "productqrbase_file_size"
    t.datetime "productqrbase_updated_at"
    t.text "qrjson"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "manufacturer_id"
    t.string "name"
    t.float "cost"
    t.float "price"
    t.text "content"
    t.integer "grounding"
    t.string "unit"
    t.string "spec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullpinyin"
    t.string "pinyin"
    t.integer "addtop"
    t.string "subtitle"
    t.string "weight"
    t.string "brand"
    t.string "pack"
    t.string "season"
    t.integer "intask"
    t.string "shelflife"
    t.float "salecount"
    t.integer "trial"
    t.integer "corder"
  end

  create_table "profits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ordernumber"
    t.float "amount"
    t.string "summary"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pushorders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ordernumber"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realnames", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "examinestatus"
    t.integer "adjust"
    t.string "adjustsummary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "idfront_file_name"
    t.string "idfront_content_type"
    t.bigint "idfront_file_size"
    t.datetime "idfront_updated_at"
    t.string "idback_file_name"
    t.string "idback_content_type"
    t.bigint "idback_file_size"
    t.datetime "idback_updated_at"
  end

  create_table "receiptaddrs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "contact"
    t.string "contactphone"
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.integer "isdefault"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street"
    t.string "adcode"
  end

  create_table "secondactivedetails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "secondactive_id"
    t.float "firstprofit"
    t.float "secondprofit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secondactives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "begintime"
    t.datetime "endtime"
    t.integer "long"
    t.integer "status"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "firstprofit"
    t.float "secondprofit"
    t.integer "showlable"
  end

  create_table "stayincomes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ordernumber"
    t.integer "incomestatus"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sysqrs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sysqr_file_name"
    t.string "sysqr_content_type"
    t.bigint "sysqr_file_size"
    t.datetime "sysqr_updated_at"
  end

  create_table "tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userfirstbuystatus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "firstbuyactive_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "login"
    t.string "openid"
    t.string "nickname"
    t.string "headurl"
    t.integer "vipid"
    t.float "income"
    t.float "withdraw"
    t.integer "ordermsg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "userbackgroundimg_file_name"
    t.string "userbackgroundimg_content_type"
    t.bigint "userbackgroundimg_file_size"
    t.datetime "userbackgroundimg_updated_at"
    t.bigint "up_id"
    t.float "agentpayment"
    t.float "deposit"
    t.bigint "agentlevel_id"
    t.string "name"
    t.string "phone"
    t.string "password_digest"
    t.string "vcode"
    t.datetime "vcodetime"
    t.integer "receiveneworder"
  end

  create_table "withdrawrecords", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.float "amount"
    t.integer "withdrawto"
    t.string "bank"
    t.string "account"
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wxmessages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
