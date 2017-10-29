Rails.application.routes.draw do
  root to: "seasons#index"

  resources :users, only: [:new, :create, :show]
  resources :seasons , only: [:index, :show]
  resources :ingredients, only: [:show] do
    resources :recipes, only: [:create, :show, :index]
    resources :posts, only: [:create, :show, :index] do
      get 'location', on: :new
    end
  end

  # resources :templates

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
