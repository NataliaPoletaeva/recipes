require 'rails_helper'

RSpec.describe Recipe, type: :model do
 before :each do
      current_user = create(:user)
      @recipe = create(:recipe, :user => current_user)
  end
  it 'is valid with valid attributes' do
    expect(@recipe).to be_valid
  end

  it 'is not valid without a name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:recipe_foods) }
  end
end
