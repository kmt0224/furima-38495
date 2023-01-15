class ItemOrdersController < ApplicationController
  before_action :move_to_new_user_session
  before_action :move_to_item_index
  def index
    @item = Item.find(params[:item_id])
  end

  private
  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_item_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
