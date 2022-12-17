class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all
  end

  def edit
  end
end
