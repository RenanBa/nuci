Rails.application.routes.draw do
  post 'add_to_cart' => 'cart#add_to_cart'
  get 'view_order' => 'cart#view_order'
  get 'checkout' => 'cart#checkout'
  get 'remove_from_cart' => 'cart#remove_from_cart'
  get 'order_complete' => 'cart#order_complete'
  get 'edit_line_item' => 'cart#edit_line_item'

  resources :orders
  resources :line_items

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'storefront#all_items'

  resources :products
end
