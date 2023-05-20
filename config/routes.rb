# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :appointments
  resources :comments
  resources :time_slots
  get '/about', to: 'pages#about', as: 'about'
  get '/contact_us', to: 'pages#contact', as: 'contact_us'
  get '/our_doctors', to: 'pages#our_doctors', as: 'our_doctors'
  get '/appointments/terminate'
  get '/appointments/index'
  get '/doctors/index'
  get '/appointments/new'
  get '/sign_up', to: 'pages#sign_up', as: 'sign_up'
  get '/sign_in', to: 'pages#sign_in', as: 'sign_in'
  get '/doctors/:id', to: 'doctors#show', as: 'doctor'
end
