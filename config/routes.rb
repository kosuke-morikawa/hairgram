Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :catalogs do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
  end
  
end
