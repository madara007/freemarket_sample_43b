Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  devise_scope :user do
    delete :sign_out, to: 'devise/sessions#destroy'
  end
  resources :items, except: [:edit] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :scores, only:[:new, :create]
    collection do
      get 'search'
    end
  end
  resources :users do
    collection do
      get "selling"
      get "purchase"
      get "logout"
    end
    get "profile"
    get "information"
    patch "entry"
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
  resources :credits, only: [:new, :create, :show]
end
