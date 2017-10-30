Rails.application.routes.draw do
  root to: "seasons#index"

  resources :users, only: [:new, :create, :show] do
    resources :recipes, only: [:show]
  end

  resources :seasons , only: [:index, :show]
  resources :recipes, only: [:show]
  resources :ingredients, only: [:show] do
    resources :recipes, only: [:create, :new]
    resources :posts, only: [:create, :index] do
      get 'location', on: :new
    end
  end

  resources :templates, only: [:show]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
