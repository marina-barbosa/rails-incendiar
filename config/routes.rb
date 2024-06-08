Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :addresses, only: [:new, :create]
  root "products#index"
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
end
