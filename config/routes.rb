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
  resources :users, only: [:index]
  resources :cards, only: [:new]
end
