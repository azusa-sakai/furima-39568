class ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @item = Items.new
  end

  def create
    Items.create(item_params)
    redirect_to '/'
  end

end
