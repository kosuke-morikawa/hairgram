Rails.application.routes.draw do
  get 'catalogs/index'
  get 'catalogs/show'
  get 'catalogs/new'
  get 'catalogs/edit'
  devise_for :users
  root to: "home#index"
  resources :users
end
