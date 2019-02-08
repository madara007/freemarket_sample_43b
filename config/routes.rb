Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get "users/logout" => "users#logout"
  resources :items
  resources :users
  resources :regions
  resources :brands
  resources :categorys
  resources :credits
end
