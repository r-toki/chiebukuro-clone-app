Rails.application.routes.draw do

  get '/signup',  to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users, only: [:create, :show]

end
