Rails.application.routes.draw do
  resources :templates
  get '/users/:id', to: 'users#show'
end
