Rails.application.routes.draw do
  resources :users, only: [:show]

  root to: 'static_pages#home'
  match '/home' => 'static_pages#home', via: :get

  match '/signin' => 'sessions#new', via: :get
  match '/signin' => 'sessions#create', via: :post
  match '/signout' => 'sessions#destroy', via: :delete
end
