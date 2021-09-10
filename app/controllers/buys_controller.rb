class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    unless @item.buy.nil?
      redirect_to root_path
    end
    @buy_residence = BuyResidence.new
  end

  def new
    @buy_residence = BuyResidence.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_residence = BuyResidence.new(buy_params)
    if @buy_residence.valid?
      pay_item
      @buy_residence.save
    redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_residence).permit(:postal_code, :prefecture_id, :city, :address, :build_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: "jpy"
      )
  end

end
