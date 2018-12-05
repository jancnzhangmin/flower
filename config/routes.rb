Rails.application.routes.draw do
  resources :tests
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
    end
  end
  resources :getopenids
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
end
