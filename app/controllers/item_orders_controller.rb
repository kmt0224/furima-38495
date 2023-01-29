class ItemOrdersController < ApplicationController
  before_action :move_to_new_user_session
  before_action :move_to_item_index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item_order = ItemOrder.new(
      user_id: current_user.id,
      item_id: params[:item_id]
    )
    @item_order.save
    Address.create(address_params)
    redirect_to root_path
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

  def address_params
    params.permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(item_order_id: @item_order.id)
  end

end
