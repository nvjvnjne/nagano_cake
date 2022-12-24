class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:order_id])
    order_detail.update
    redirect_to admin_top_path
  end
end
