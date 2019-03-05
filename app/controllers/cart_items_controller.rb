class CartItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @cart_item = CartItem.new 
  end

  def create
    @cart_item =CartItem.new(quantity: 1, cart: current_user.carts[0],item_id: params[:format])
    @cart_item.save
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    flash[:notice] = "Item successfully removed"
    redirect_back fallback_location: root_path
  end

end
