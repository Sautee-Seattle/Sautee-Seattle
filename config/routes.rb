Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :templates
end
