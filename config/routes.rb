Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'welcome#index'
  get 'about' => 'welcome#about', as:'about'
  get 'prints' => 'products#prints', as:'prints'
  get 'paintings' => 'products#paintings', as:'paintings'
  get 'drawings' => 'products#drawings', as:'drawings'
end
