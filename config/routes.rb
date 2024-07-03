Rails.application.routes.draw do
  root "products#index"
  devise_for :users
  resources :users, only: [:show]
  resources :addresses, only: [:new, :create]
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :cart_items, only: [:index]
  resources :orders, only: [:new, :create, :show]
end
