require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  before :each do
    current_user = create(:user)
    inventory = create(:inventory, user: current_user)
    food = create(:food, user: current_user)
    @inventory_food = create(:inventory_food, inventory:, food:)
  end
  it 'is valid with valid attributes' do
    expect(@inventory_food).to be_valid
  end

  it 'is not valid without a quantity' do
    @inventory_food.quantity = nil
    expect(@inventory_food).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:inventory) }
    it { should belong_to(:food) }
  end
end
