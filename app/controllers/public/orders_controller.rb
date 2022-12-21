class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end
  
  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    redirect_to order_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def comfirm
  end

  def complete
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
