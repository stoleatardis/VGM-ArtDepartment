Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  root 'welcome#index'
  get 'about' => 'welcome#about', as:'about'
  get 'contact' => 'welcome#contact', as:'contact'
  
  get 'products' => 'products#index', as:'products'
  get 'products/:id' => 'products#show',  as: 'product'
  get 'categories/:id/products' => 'products#products_in_category', as: 'products_in_category'

  get 'cart' => 'products#checkout', as: 'checkout'

  post 'add_to_cart/:id' => 'products#add_product_to_cart', as: 'add_to_cart'

  post 'create_customer_invoice' => 'products#create_customer_invoice', as:'create_customer_invoice'

  post 'purchase' => 'products#purchase_product', as: 'purchase'

  get 'customer_checkout/:id' => 'products#customer_checkout', as: 'customer_checkout'

  get 'search' => 'products#search_results', as: 'search_results'
end
