class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private

  def items_params
    params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  end
end
