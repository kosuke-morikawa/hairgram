Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :catalogs do
    resource :favorites, only: [:create, :destroy]
  end
  get "search" => "searches#search"
end
