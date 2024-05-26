Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [:show, :new, :create, :edit, :update]
end
