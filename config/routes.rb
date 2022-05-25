Rails.application.routes.draw do
  devise_for :users
  patch '/recipes/:recipe_id/recipe_food/:id', to: 'recipe_food#update', as: 'edit_recipe_recipe_food'
  resources :recipes, only: [:index, :show, :create, :new, :update, :destroy] do
    resources :recipe_food
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  get '/public_recipes', to: 'recipes#index', as: 'public_recipes'
  
  root "users#index"
end
