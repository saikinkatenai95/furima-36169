class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @buy_residence = BuyResidence.new
  end

  def create
    binding.pry
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
    params.permit(:postal_code, :prefecture_id, :city, :address, :build_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
