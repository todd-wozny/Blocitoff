class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id]) #current_user
    @item = @user.items.create(item_params)
    redirect_to user_path(@user)
  end
 
  private
    def item_params
      params.require(:item).permit(:name)
    end
end
