Rails.application.routes.draw do
  resources :orders
  resources :line_items

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'storefront#all_items'

  resources :products
end
