Rails.application.routes.draw do

  root to: 'home#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :new, :create, :show, :destroy] do
    resources :best_answers, module: 'questions', only: [:update]
  end
  resources :answers, only: [:create, :destroy]

end
