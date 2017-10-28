Rails.application.routes.draw do
  root to: "seasons#index"
  
  resources :users, only: [:new, :create, :show]
  resources :seasons , only: [:index, :show]

  resources :templates
end
