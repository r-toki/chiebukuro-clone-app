Rails.application.routes.draw do

  root to: 'static_pages#home'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :new, :create, :show, :update, :destroy]
  resources :answers, only: [:create, :update, :destroy]

end
