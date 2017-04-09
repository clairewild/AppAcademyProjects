Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  # resources :albums
  # resources :bands
  resources :tracks, only: [:new, :create, :index]
end
