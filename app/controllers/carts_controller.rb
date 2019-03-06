class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cart = Cart.all
  end

  def show
  	@cart = Cart.find(params[:id])
  	@cart_items = @cart.cart_items
    @profile = current_user.profile

	  @subtotal=0
	  @cart_items.each do |cart_item|
		  price = cart_item.item.price
		  @subtotal+=price
		end
	end

  def create
  	cart = Cart.create(status: 0, user: current_user)
  end

  def update
  	cart = Cart.update(status: 0, user: current_user)
  end

end

