Rails.application.routes.draw do
  resources :seasons , only: [:index, :show]

  root to: "seasons#index"
end
