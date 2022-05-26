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

    context 'with render_views enabled' do
      it 'renders view with text in the index template' do
        expect(response.body).to have_content('Add Ingredient')
      end
    end
  end
end
