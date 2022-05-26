require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  describe 'GET recipes/:recipe_id/recipe_foods/new' do
    before :each do
      current_user = create(:user)
      recipe = FactoryBot.create(:recipe, user: current_user)
      login_as(current_user)
      get new_recipe_recipe_food_path(recipe)
    end
    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the recipe_food/new view' do
      expect(response).to render_template('recipe_food/new')
    end
  end

  describe 'GET recipes/:recipe_id/recipe_foods/edit' do
    before :each do
      current_user = create(:user)
      @recipe = create(:recipe, user: current_user)
      @food = create(:food, user: current_user)
      @recipe_food = create(:recipe_food, recipe_id: @recipe.id, food_id: @food.id)
      login_as(current_user)
      get edit_recipe_recipe_food_path(recipe_id: @recipe.id, id: @recipe_food.id)
    end
    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the recipe_food/edit view' do
      expect(response).to render_template('recipe_food/edit')
    end
  end
end
