class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /inventories
  def index
    @inventories = Inventory.where(user_id: current_user.id)
  end

  # GET /inventories/1
  def show
    @inventory = Inventory.find(params[:id])
    @foods = InventoryFood.where(inventory_id: params[:id]).includes(:food)
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit; end

  # POST /inventories
  def create
    @inventory = current_user.inventories.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
