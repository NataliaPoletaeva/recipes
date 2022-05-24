Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :create, :new, :destroy]
  
  root "users#index"
end
