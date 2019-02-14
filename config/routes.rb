Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { sessions: 'sessions' ,registrations: "registrations"}
  resources :items, except: [:edit, :destroy]
  resources :users do
    collection do
      get "selling"
      get "progress"
      get "complete"
      get "purchase"
      get "purchased"
      get "logout"
    end
  end
  get 'auth/:provider/callback', to: 'googles#create'
  get 'signout', to: 'googles#destroy'
  get '/auth/:provider/callback',    to: 'users#create'
  resources :regions, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :credits, only: [:index, :new, :create]
end
