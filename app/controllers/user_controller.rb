class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @item = @user.items
  end
end
