class ItemOrdersController < ApplicationController
  before_action :move_to_new_user_session
  before_action :move_to_item_index
  before_action :exist_item_move_to_index
  
  def index
    @item = Item.find(params[:item_id])
    @item_order_address = ItemOrderAddress.new
  end

  def create
    @item_order_address = ItemOrderAddress.new(item_order_params)
    if @item_order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,
        card: item_order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @item_order_address.save
      redirect_to root_path
    else
      render :index
    end
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

  def item_order_params
    params.require(:item_order_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def exist_item_move_to_index
    @item = Item.find(params[:item_id])
    if ItemOrder.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

end
