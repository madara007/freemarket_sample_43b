Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { sessions: 'sessions' ,registrations: "registrations"}
  get "users/logout", "users#logout"
  resources :items, except: [:edit, :destroy]
  resources :users, only: [:index, :new, :edit, :show]
  # resources :regions
  # resources :brands
  resources :categories do
    collection do
      get 'search'
    end
  end
  resources :sizes
  resources :ship_methods
  resources :credits, only: [:index, :new, :create]
end
