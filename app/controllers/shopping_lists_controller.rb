class ShoppingListsController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventory_id])
    @recipe = Recipe.find(params[:recipe_id])

    @recipe_foods = Food.all.joins('INNER JOIN recipe_foods ON foods.id = recipe_foods.food_id')
      .order(created_at: :desc).select('foods.*, recipe_foods.quantity, recipe_foods.id as recipe_foods_id')
      .where(recipe_foods: { recipe_id: params[:recipe_id] })
    @inventory_foods = Food.all.joins('INNER JOIN inventory_foods ON foods.id = inventory_foods.food_id')
      .select('foods.*, inventory_foods.quantity, inventory_foods.id as inventory_foods_id')
      .where(inventory_foods: { inventory_id: params[:inventory_id] })
    @recipe_food_with_quantity_greater_than_inventory_food_quantity = []
    @recipe_foods.select do |recipe_food|
      @inventory_foods.select do |inventory_food|
        if recipe_food.id == inventory_food.id && recipe_food.quantity > inventory_food.quantity
          recipe_food.quantity = recipe_food.quantity - inventory_food.quantity
          @recipe_food_with_quantity_greater_than_inventory_food_quantity << recipe_food
        end
      end
    end
    @recipe_foods_not_in_inventory = @recipe_foods - @inventory_foods
    @shopping_list = @recipe_foods_not_in_inventory + @recipe_food_with_quantity_greater_than_inventory_food_quantity
    @cost = 0
    @shopping_list.each do |list|
      @cost += list.price * list.quantity
    end
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @inventories = Inventory.where(user_id: current_user.id)
  end
end
