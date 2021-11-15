class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  #before_action :prevent_url, only: [:edit, :update]
  before_action :set_furima, only: [:edit, :show, :updat]
  #before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
    # @items = Item.includes(:user)
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

  def show 
  end

  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
    elsif @item.user_id != current_user.id || !@item.buy.nil?
      redirect_to root_path
    else
      @item.user_id == current_user.id
      render :edit
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :status_id, :category_id, :area_id, :detail_id, :shipping_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_furima
     @item = Item.find(params[:id])
  end

  #def move_to_index
    #redirect_to new_user_session_path unless user_signed_in?
  #end

  def prevent_url
    # if @item.user_id != current_user.id || @item.buy != nil
    # redirect_to new_user_session_path
    # end
  end
end
