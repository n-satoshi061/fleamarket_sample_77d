Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index,:new, :show, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
      post 'pay'
    end
    member do
      get 'buy'
    end
  end
  resources :signup, only: :create do
    collection do
      get 'step1'
      get 'step2'
    end
  end
  resources :users, only: [:index] do
    collection do
      get 'logout_page'
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end
end
