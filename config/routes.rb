Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :show, :destroy]

  resources :users, only: [:index]
  resources :cards, only: [:new]

end
