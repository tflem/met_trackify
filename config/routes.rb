Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  get '/projects',              to: 'projects#index'

  resources :products
  resources :projects
end
