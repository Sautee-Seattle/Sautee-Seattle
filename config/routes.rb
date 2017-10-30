Rails.application.routes.draw do
  root to: "seasons#index"

  resources :users, only: [:new, :create, :show] do
    resources :recipes, only: [:show]
  end

  resources :seasons , only: [:index, :show]
  resources :recipes, only: [:show]
  resources :ingredients, only: [:show] do
    resources :locations, only: [:index, :create]
    resources :posts, only: [:create, :show] do
      resources :locations, only: [:new]
    end
  end

  resources :templates, only: [:show]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
