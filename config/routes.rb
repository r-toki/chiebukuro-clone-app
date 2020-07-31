Rails.application.routes.draw do

  resources :users, only: [:create, :show]
  # 'users#new' は get '/singup' と対応させるから必要ない？

  root to: 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

end
