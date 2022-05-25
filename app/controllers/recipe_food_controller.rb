class RecipeFoodController < ApplicationController
  before_action :set_recipe_food, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
  end

  def show
  end
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = @recipe.id

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe  food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end


  # def create
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @recipe_food = RecipeFood.new(recipe_food_params)
  #   @recipe_food.recipe_id = @recipe.id

  #   if @recipe_food.save
  #     redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Ingredient was added successfully!'
  #   else
  #     flash[:alert] = 'Failed creating ingredient'
  #     redirect_back(fallback_location: root_path)
  #   end
  # end

  # def edit

  # end

  # def update
  #   recipe_food = RecipeFood.find(params[:id])

  #   if recipe_food.update(recipe_food_params)
  #     redirect_to recipe_path(recipe_food.recipe_id), notice: 'Ingredient was edited successfully!'
  #   else
  #     redirect_to recipe_path(recipe_food.recipe_id), alert: 'Error editing ingredient!'
  #   end
  # end

  # def destroy
  #   recipe_food = RecipeFood.find(params[:id])
  #   recipe_food.destroy

  #   redirect_to recipe_path(recipe_food.recipe_id), notice: 'Ingredient was deleted successfully!'
  # end