FootballNetwork::Application.routes.draw do

  root :to => 'static_pages#home'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "static/contact"

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/news',    to: 'static_pages#news'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete




end
