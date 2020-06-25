Rails.application.routes.draw do
  devise_for :users
  root 'products#buy'
  resources :products, only: [:index, :show, :buy, :destroy]
end
