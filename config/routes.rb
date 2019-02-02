Rails.application.routes.draw do
  root 'users#index'
  resources :items
  resources :users
  resources :regions
  resources :brands
  resources :categorys
end
