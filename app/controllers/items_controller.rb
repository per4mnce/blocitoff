class ItemsController < ApplicationController
  
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!
  
  def index
    @items = current_user.items
  end
 
  def show
  end
  
  def create
    @item = current_user.items.build(item_params)
    
    if @item.save
      flash[:notice] = "saved"
      redirect_to items_path
    else
      render :new
    end
  end
  
  def edit
     @item = Item.find(params[:id])
  end
  
  def update
     @item = Item.find(params[:id])
     if @item.save
       flash[:notice] = "Todo was updated."
       redirect_to @item
     else
       flash[:error] = "Error saving todo. Please try again."
       render :edit
     end
  end
  
  def new
    @item = Item.new
  end

  def destroy
     @item = Item.find(params[:id])
 
     if @item.destroy
       flash[:notice] = "\"#{@item.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash[:error] = "There was an error deleting the todo."
       render :show
     end
  end
  
  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :done)
  end
  
end
