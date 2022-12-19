class Public::CartItemsController < ApplicationController

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.user_id = current_customer.id
    cart_item.item_id = item.id
    cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item)
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
