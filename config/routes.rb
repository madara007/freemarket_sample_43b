Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :users
  resources :regions
  resources :brands
  resources :categorys
end
