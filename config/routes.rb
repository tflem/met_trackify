Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
  end
  devise_for :users
  root "products#index"
  get "/projects",              to: 'projects#index'

  resources :products
  resources :projects
end
