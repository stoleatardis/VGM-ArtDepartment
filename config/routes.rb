Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  root 'welcome#index'
  get 'about' => 'welcome#about', as:'about'
  get 'contact' => 'welcome#contact', as:'contact'
  
  get 'products' => 'products#index', as:'products'
  get 'products/:id' => 'products#show',  as: 'product'
  get 'categories/:id/products' => 'products#products_in_category', as: 'products_in_category'
end
