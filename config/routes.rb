Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
resources :appointments 
  get '/appointments/terminate'
  get '/appointments/index'
  get '/doctors/index'
  get '/appointments/new'
end
