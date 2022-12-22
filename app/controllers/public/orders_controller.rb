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
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    byebug
    @order.shipping_cost = 800
    @sum = 0
    @order.total_payment = current_customer.order.shipping_cost + @sum
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    render :confirm
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
