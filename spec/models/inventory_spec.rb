require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before :each do
    current_user = create(:user)
    @inventory = create(:inventory, user: current_user)
  end
  it 'is valid with valid attributes' do
    expect(@inventory).to be_valid
  end

  it 'is not valid without a name' do
    @inventory.name = nil
    expect(@inventory).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:inventory_foods) }
  end
end
