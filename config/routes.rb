Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :catalogs do
    resources :favorites, only: [:create, :destroy]
  end
end
