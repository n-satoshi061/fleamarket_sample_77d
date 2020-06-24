Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :products, only: [:index, :destroy]
  resources :users, only: [:index, :show]
end
