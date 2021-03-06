Rails.application.routes.draw do
  
  resources :inventories do
    resources :inventory_foods
  end
  devise_for :users
  resources :recipes, only: [:index, :show, :create, :new, :update, :destroy] do
    patch '/recipe_food/:id', to: 'recipe_food#update'
    get '/choose_inventory', to: 'shopping_lists#new', as: 'choose_inventory'
    post '/shopping_list', to: 'shopping_lists#index', as: 'shopping_list'
    resources :recipe_food, only: [:index, :create, :new, :destroy, :edit]
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  get '/public_recipes', to: 'recipes#public', as: 'public_recipes'
  
  root "recipes#index"
end
