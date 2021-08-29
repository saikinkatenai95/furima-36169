class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new

  end


private
def item_params
  params.require(:item).permit(:name, :image, :info, :category_id, :item_status, :delivery_fee_id, :prefecture_id, :read_time_id, :price).merge(user_id: current_user.id)
  end
