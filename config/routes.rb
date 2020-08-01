Rails.application.routes.draw do

  resources :users, only: [:create, :show]
  # 'users#new' は get '/singup' と対応させるから必要ない？
  resources :questions, only: [:index]

  root to: 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
