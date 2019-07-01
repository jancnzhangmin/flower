Rails.application.routes.draw do
  resources :tests do
    collection do
      #post 'deliver'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :configs
  resources :manufacturers
  resources :products do
    collection do
      get 'addtop'
      post 'saveagentprice'
    end
    resources :productimgs do
      member do
        get 'setdefault'
      end
    end
    resources :optionals do
      resources :conditions
    end
    resources :productqrs
    member do
      get 'agentprice'
    end
  end
  resources :secondactives do
    resources :secondactivedetails do
      member do
        get 'singleaddactive'
        get 'singleremoveactive'
      end
      collection do
        post 'addactive'
        post 'removeactive'
      end
    end
  end
  resources :firstbuyactives do
    resources :firstbuyactivedetails do
      member do
        get 'newproduct'
        get 'editproduct'
      end
    end
  end
  resources :limitactives do
    resources :limitactivedetails do
      member do
        get 'newproduct'
        get 'editproduct'
      end
    end
  end
  resources :buyfullactives do
    resources :buyfullactivedetails do
      member do
        get 'newproduct'
        get 'editproduct'
      end
    end
  end
  resources :clas do
    member do
      get 'up'
      get 'down'
    end
    resources :claproducts do
      member do
        get 'singleadd'
        get 'singleremove'
      end
      collection do
        post 'add'
        post 'remove'
      end
    end
  end
  resources :activecolors
  resources :api do
    collection do
      get 'get_recommend_product'
      get 'get_product_detail'
      get 'collection'
      post 'submitbuycar'
      get 'force_collection'
      get 'get_amapkey'
      get 'set_address'
      get 'get_address_list'
      get 'get_address'
      get 'del_address'
      get 'get_collection'
      get 'get_class'
      get 'get_product_list'
      get 'get_appoint_address'
      post 'buycar_to_order'
      get 'get_unpay_list'
      get 'delete_order'
      get 'get_unpay_count'
      get 'get_unapyorder'
      get 'get_undeliver_list'
      get 'get_undeliver_count'
      get 'pay_process'
      get 'pay'
      get 'get_unreceipt_list'
      get 'get_unreceipt_count'
      get 'query_express'
      get 'confirm_receipt'
      get 'get_uncomment_list'
      get 'get_uncomment_count'
      get 'get_draft_comment'
      post 'upload_commentimg'
      get 'delete_commentimg'
      get 'comment'
      get 'get_search'
      get 'check_subscribe'
      get 'get_sysqr'
      get 'get_productqr'
      get 'get_comment_img_top'
      get 'get_comment_img_list'
      get 'get_comment_user_top'
      get 'get_conditionimg'
      get 'get_cla_product'
      get 'get_productdetail_tuijian_list'
      get 'get_agent'
      get 'get_self_agent'
      get 'set_autoupgrade'
      get 'set_showphone'
      get 'set_agentphone'
      get 'get_certificates'
      get 'get_directagent_list'
      get 'get_directagent_detail'
      get 'change_agent_examination'
      get 'get_directagent_echarts'
      get 'get_directagnet_agentlevel_list'
      get 'validation_user_password'
      get 'get_user_phone'
      get 'send_user_vcode'
      get 'validation_user_vcode'
      get 'set_user_password'
      get 'change_directagentlevel'
      get 'check_agent_status'
    end
  end
  resources :getopenids do
    collection do
      get 'getopenid'
    end
  end
  resources :explains do
    resources :explainproducts do
      member do
        get 'singleadd'
        get 'singleremove'
      end
      collection do
        post 'addexplain'
        post 'removeexplain'
      end
    end
  end
  resources :freeposts
  resources :delivercodes
  resources :orders do
    resources :orderdetails
    resources :orderdelivers do
      collection do
        get 'get_delivername'
      end
    end
  end
  resources :users do
    resources :agentpaymentrecorders
    member do
      get 'deposit'
      post 'update_deposit'
    end
    member do
      get 'addtoagent'
      post 'postaddtoagent'
    end
    collection do
      get 'get_up_user_list'
    end
   end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :monitors
  resources :sysqrs
  resources :agentlevels do
    member do
      get 'order_up'
      get 'order_down'
    end
  end
  resources :agentusers do
    resources :agentcertificates
  end
end
