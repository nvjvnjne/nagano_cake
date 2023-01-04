class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order_details = OrderDetail.where(order_id: params[:id])
    if order.update(order_params)
      order_details.update_all(making_status: 1) if order.status == "have_paid"
    end
      redirect_to admin_order_path
  end

  private
  def order_params
    params.require(:order).permit(:address, :postal_code, :name, :status)
  end
end
