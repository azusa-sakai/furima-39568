class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if current_user != @item.user
      redirect_to root_path
    end
  end

  def update
      if @item.update(items_params)
        redirect_to @item
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
    end
    redirect_to root_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :days_until_shipping_id, :price, :image).merge(user_id: current_user.id)
  end
end
