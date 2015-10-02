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
      flash[:error] = @item.errors.full_messages.to_sentence
      # flash[:error] = "My custom message"
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    # @item = Item.find(params[:id]) - not necessary because of before_action to set item
     @item.assign_attributes(item_params)
     if @item.save
       flash[:notice] = "Todo was updated."
      redirect_to items_path 
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
    begin
      @item = current_user.items.find(params[:id]) 
    rescue 
      @item = nil
    end
  end
  
  def item_params
    params.require(:item).permit(:name, :done, :desc)
  end
  
end
