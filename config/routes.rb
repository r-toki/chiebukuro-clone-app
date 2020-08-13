Rails.application.routes.draw do

  root 'static_pages#home'

  get '/signup',  to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users, only: [:create, :show]
  resources :questions, only: [:index, :new, :create, :show, :update, :destroy]
  resources :answers, only: [:create, :update, :destroy]

end
