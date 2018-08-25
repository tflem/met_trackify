Rails.application.routes.draw do  
  devise_for :users
  root "products#index"

  namespace :admin do
    root "application#index"

    resources :products, only: [:new, :create, :destroy]
    resources :projects, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
  end

  resources :products, only: [:index, :show, :edit, :update]
  resources :projects, only: [:index, :show, :edit, :update]
end
