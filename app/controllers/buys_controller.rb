class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @buy = Buy.create(buy_params)
    Residence.create(residence_params)
    redirect_to root_path
  end

  private

  def buy_params
    params.merge(user_id: current_user.id, item_id: @item.id)
  end

  def residence_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :build_name, :phone_number).merge(buy_id: @buy.id)
  end

end
