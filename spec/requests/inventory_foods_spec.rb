require 'rails_helper'

RSpec.describe 'InventoryFoods', type: :request do
  describe 'GET inventories/:inventory_id/inventory_foods/new' do
    before :each do
      current_user = create(:user)
      inventory = FactoryBot.create(:inventory, user: current_user)
      login_as(current_user)
      get new_inventory_inventory_food_path(inventory)
    end
    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the inventory_foods/new view' do
      expect(response).to render_template('inventory_foods/new')
    end
  end
end
