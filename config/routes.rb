Rails.application.routes.draw do

  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  post '/static_pages/create_question', to: 'static_pages#create_question'

  resources :users
  resources :questions

end
