Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :show, :buy, :destroy]
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
  resources :cards, only: [:new]
end
