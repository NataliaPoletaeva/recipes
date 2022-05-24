Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :create, :new, :destroy]
  resources :recipe_food, only: [:index, :edit, :update, :create, :new, :destroy]
  get '/public_recipes', to: 'recipes#index', as: 'public_recipes'
  root "users#index"
end
