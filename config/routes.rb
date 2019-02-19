Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: { sessions: 'sessions' ,registrations: "registrations"}
  resources :items, except: [:edit, :destroy] do
    resources :comments, only: [:create]
    resources :scores, only:[:new, :create]
    collection do
      get 'search'
    end
  end
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
  resources :categories, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
  resources :sizes
  resources :ship_methods
  resources :credits, only: [:index, :new, :create, :show]
end
