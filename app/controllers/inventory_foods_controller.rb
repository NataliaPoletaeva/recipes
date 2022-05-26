class InventoryFoodsController < ApplicationController
  before_action :set_inventory_food, only: %i[ show destroy ]
  before_action :authenticate_user!

  # GET /inventory_foods or /inventory_foods.json
  def index
  end

  # GET /inventory_foods/1 or /inventory_foods/1.json
  def show
  end

  # GET /inventory_foods/new
  def new
    
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.new
    @foods = Food.where(user_id: current_user.id)
  end

  # POST /inventory_foods or /inventory_foods.json
  def create
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.new(inventory_food_params)
    @inventory_food.inventory_id = @inventory.id

    respond_to do |format|
      if @inventory_food.save
        format.html { redirect_to inventory_path(@inventory), notice: "Inventory food was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_foods/1 or /inventory_foods/1.json
  def destroy
    @inventory_food.destroy

    respond_to do |format|
      format.html { redirect_to inventory_path(params[:inventory_id]), notice: "Inventory food was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_food
      @inventory_food = InventoryFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_food_params
      params.require(:inventory_food).permit(:quantity, :food_id)
    end
end
