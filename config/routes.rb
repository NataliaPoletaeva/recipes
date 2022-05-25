Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :create, :new, :update, :destroy]
  resources :recipe_food, only: [:index, :edit, :update, :create, :new, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]
  get '/public_recipes', to: 'recipes#index', as: 'public_recipes'
  
  root "users#index"
end
