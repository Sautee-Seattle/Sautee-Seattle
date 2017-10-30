Rails.application.routes.draw do
  root to: "seasons#index"

  resources :users, only: [:new, :create, :show]
  resources :seasons , only: [:index, :show]
  resources :ingredients, only: [:show] do
    resources :locations, only: [:index, :create]
    resources :posts, only: [:create, :show] do
      resources :locations, only: [:new]
    end
  end

  # resources :templates

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
