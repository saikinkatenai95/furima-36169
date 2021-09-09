class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_residence = BuyResidence.new(buy_params)
    if @buy_residence.valid?
      @buy_residence.save
    redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_residence).permit(:postal_code, :prefecture_id, :city, :address, :build_name, :phone_number).merge(buy_id: @buy.id, user_id: current_user.id, item_id: @item.id)
  end

end
