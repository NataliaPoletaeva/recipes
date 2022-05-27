require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  describe 'GET /inventories' do
    before :each do
      current_user = create(:user)
      create(:inventory, user: current_user)
      login_as(current_user)
      get inventories_path
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the inventories/index view' do
      expect(response).to render_template('inventories/index')
    end

    context 'with render_views enabled' do
      it 'renders view with home page text in the index template' do
        expect(response.body).to include('Inventories')
      end
    end
  end

  describe 'GET /inventories/:id' do
    before :each do
      current_user = create(:user)
      inventory = FactoryBot.create(:inventory, user: current_user)
      login_as(current_user)
      get inventory_path(id: inventory.id)
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the inventories/show view' do
      expect(response).to render_template('inventories/show')
    end

    context 'with render_views enabled' do
      it 'renders view with inventory 1 text in the show template' do
        expect(response.body).to include('inventory 1')
      end
    end
  end
end
