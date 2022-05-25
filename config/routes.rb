Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :create, :new, :update, :destroy] do
    patch 'recipe/:recipe_id/recipe_food/:recipe_food_id', to: 'recipe_food#update'
    resources :recipe_food, only: [:update, :index, :edit, :create, :new, :destroy]
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  get '/public_recipes', to: 'recipes#index', as: 'public_recipes'
  
  root "users#index"
end
