Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { sessions: 'sessions' ,registrations: "registrations"}
  get "users/logout", "users#logout"
  resources :items, except: [:edit, :destroy]
  resources :users, only: [:index, :new, :edit, :show]
  get 'auth/:provider/callback', to: 'googles#create'
  get 'signout', to: 'googles#destroy'
  get '/auth/:provider/callback',    to: 'users#create'
  resources :regions, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :categories do
    collection do
      get 'search'
    end
  end
  resources :sizes
  resources :ship_methods
  resources :credits, only: [:index, :new, :create]
end
