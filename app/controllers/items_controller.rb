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
  end
  
  def update
  end
  
  def new
    @item = Item.new
  end

  def delete
  end
  
  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :done)
  end
  
end
