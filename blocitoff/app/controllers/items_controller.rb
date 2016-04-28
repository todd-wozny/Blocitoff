class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id]) #current_user
    @item = @user.items.create(item_params)
   # @item = @user.items.new(item_params)
    @item.user = current_user
     redirect_to user_path(@user)
   
  #if @item.save
   #  flash[:notice] = "Item saved successfully."
   #else
    # flash[:alert] = "Item failed to save."
   #end

  # respond_to do |format|
    # format.html
     #format.js
   #end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
  #  @item.destroy 
   # redirect_to user_path(@user)
   
    if @item.destroy
     flash[:notice] = "Item was deleted successfully."
     #redirect_to [@user.item, @user]
    else
     flash[:alert] = "Item couldn't be deleted. Try again."
  #  redirect_to [@user.item, @user]
    end

    respond_to do |format|
     format.html
     format.js
    end
  end
 
  private
    def item_params
      params.require(:item).permit(:name)
    end
end
