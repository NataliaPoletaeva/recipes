require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    before :each do
      get recipes_path
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the recipes/index view' do
      expect(response).to render_template('recipes/index')
    end

    context 'with render_views enabled' do
      it 'renders view with home page text in the index template' do
        expect(response.body).to include('Recipes')
      end
    end
  end
  describe 'GET /recipes/:id' do
    before :each do
      recipe = FactoryBot.create(:recipe)
      get recipe_path(id: recipe.id)
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the recipes/show view' do
      expect(response).to render_template('recipes/show')
    end

    context 'with render_views enabled' do
      it 'renders view with pizza text in the show template' do
        expect(response.body).to include('pizza')
      end
    end
  end
end
