Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { sessions: 'sessions' ,registrations: "registrations"}
  get "users/logout", "users#logout"
  resources :items
  resources :users
  resources :regions
  resources :brands
  resources :categorys
  resources :credits
end
