Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items
  resources :profiles , only: [:show, :new, :create, :edit, :update]
  resources :carts
  resources :cart_items
end
