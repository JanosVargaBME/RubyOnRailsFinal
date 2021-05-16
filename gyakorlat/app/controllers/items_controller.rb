class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    #@items = Item.all
    #@item1 = Item.new name: "Project 1", description: "Project 1", id: 1
    #@item2 = Item.new name: "Project 2", description: "Project 2", id: 1
    #@items = []
    #@items << @item1
    #@items << @item2
    #@items = Item.get_items_page(params[:page])
   end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
      #@item = Item.new name: "Project 1", description: "Project 1", id: 1
      #@resources = []
      #@resource1 = Resource.new name: 'File1', item: @item, version: '1.0', id: 1
      #@resource2 = Resource.new name: 'File2', item: @item, version: '1.0', id: 2

      #@resources << @resource1
      #@resources << @resource2
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description)
    end
end
