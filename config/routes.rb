Rails.application.routes.draw do
  root 'items#index'
  get "users/registration" => "users#registration"
  get "users/select" => "users#select"
  resources :items
  resources :users
  resources :regions
  resources :brands
  resources :categorys
end
