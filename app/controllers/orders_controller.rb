class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :log_in
  before_action :move_to_index
  before_action :move_to_soldout

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def log_in
      redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
     if current_user.id == @item.user_id
        redirect_to root_path
     end
  end

  def move_to_soldout
    if @item.order.present?
      redirect_to root_path
    end
  end
end
