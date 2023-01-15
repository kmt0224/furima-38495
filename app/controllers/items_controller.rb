class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_new_user_session, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :explanation, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :date_of_shipment_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
