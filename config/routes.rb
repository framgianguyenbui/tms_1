Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :subjects

    root to: "static_pages#home"
  end
  resources :users, only: [:show]
  resources :courses, only: [:show]

  root to: "static_pages#home"
  match "/home" => "static_pages#home", via: :get
  match "/signin" => "sessions#new", via: :get
  match "/signin" => "sessions#create", via: :post
  match "/signout" => "sessions#destroy", via: :delete
end
