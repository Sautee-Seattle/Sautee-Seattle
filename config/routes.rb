Rails.application.routes.draw do
  root to: "seasons#index"

  resources :seasons , only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :seasons , only: [:index, :show]

  resources :templates

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
