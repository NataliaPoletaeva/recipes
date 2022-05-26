class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show update destroy]
  before_action :authenticate_user!, except: [:public, :show]

  # GET /recipes
  def index
    @recipes = current_user.recipes.all
  end
  
  def public
    @public_recipes = Recipe.where(public: true)
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = RecipeFood.where(recipe_id: params[:id]).includes(:food)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /recipes/:id
  def update
    @recipe.update(public: !@recipe.public)
    redirect_to recipe_path(@recipe.id), notice: "The recipe is now #{@recipe.public ? 'public' : 'private'}!"
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
