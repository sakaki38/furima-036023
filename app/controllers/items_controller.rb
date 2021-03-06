class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, only: [:edit, :show, :update, :destroy]
  

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @item.user_id != current_user.id || @item.buy.present?
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if current_user.id == @item.user_id
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :status_id, :category_id, :area_id, :detail_id, :shipping_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_furima
    @item = Item.find(params[:id])
  end
end
