Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
end
