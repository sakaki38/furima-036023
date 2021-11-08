class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :status_id, :category_id, :area_id, :detail_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end