Rails.application.routes.draw do
  root "products#index"
  get '/projects',              to: 'projects#index'

  resources :products
  resources :projects
end
