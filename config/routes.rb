Rails.application.routes.draw do
  resources :seasons , only: [:index, :show]
  resources :templates
end
