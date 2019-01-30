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
  resources :users
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :monitors
end
