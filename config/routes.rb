Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get "users/logout" => "users#logout"
  resources :items, except: [:edit, :destroy]
  resources :users, only: [:index, :new, :edit, :show]
  # resources :regions
  # resources :brands
  # resources :categorys
  resources :credits, only: [:index, :new, :create]
end
