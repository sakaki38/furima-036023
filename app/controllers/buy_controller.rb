class BuyController < ApplicationController
  before_action :prevent_url, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]

  def index
  end

  def create
  end

  private

  def set_furima
    # @item = Item.find(params[:item_id])
  end

  def prevent_url
    # if @item.user_id == current_user.id || @item.buy != nil
    # redirect_to root_path
    # end
  end
end
