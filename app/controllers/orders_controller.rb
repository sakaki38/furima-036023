class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new(order_params)
    if @buy_order.valid?
      pay_item
      @buy_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:buy_order).permit(:post_code, :area_id, :city, :phone_number, :building_name, :address).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
