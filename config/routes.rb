Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

end
