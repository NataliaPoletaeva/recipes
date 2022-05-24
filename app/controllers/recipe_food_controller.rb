class RecipeFoodController < ApplicationController
 before_action :set_recipe_food, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @recipe_food = User.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe_food), notice: "Recipe  food was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipes_url(@recipe_food), notice: "Recipe food was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url(@recipe_food), notice: "Recipe food was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_food
      @recipe_food = RecipeFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_food_params
      params.require(:recipe_food).permit(:quantity, :)
    end
end
