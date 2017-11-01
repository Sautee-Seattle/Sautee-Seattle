Rails.application.routes.draw do
  root to: "seasons#index"

  resources :users, only: [:new, :create, :show] do
    resources :recipes, only: [:show]
  end

  resources :seasons , only: [:index, :show]
  resources :recipes, only: [:show, :destroy]
  resources :ingredients, only: [:show] do
    resources :recipes, only: [:create, :new, :index]
    resources :locations, only: [:index, :create, :new]
  end

  resources :locations, only: [:destroy]
  resources :templates, only: [:show]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
