Rails.application.routes.draw do

  resources :users, only: [:create, :show]
  resources :questions, only: [:index, :new, :create, :show]

  root to: 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
