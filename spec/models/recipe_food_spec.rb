require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
      current_user = create(:user)
      recipe = create(:recipe, :user => current_user)
      food = create(:food, :user => current_user)
      @recipe_food = create(:recipe_food, :recipe => recipe, :food => food)
  end
  it 'is valid with valid attributes' do
    expect(@recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:food) }
  end
end
