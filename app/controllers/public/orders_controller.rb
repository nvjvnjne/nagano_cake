class Public::OrdersController < ApplicationController

  def new
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
end
