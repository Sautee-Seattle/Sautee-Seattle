Rails.application.routes.draw do
  resources :seasons , only: [:index, :show]

  root to: "seasons#index"
  resources :templates
  get '/users/:id', to: 'users#show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
