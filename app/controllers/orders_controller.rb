class OrdersController < ApplicationController
  before_action :purchase_goods, only: [:index]
  before_action :seller, only: [:index]
  before_action :sold, only: [:index]

  def index
    @order_item = OrderItem.new
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_item = OrderItem.new(order_params)
    if @order_item.valid?
      pay_item
      @order_item.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_goods
    redirect_to root_path unless user_signed_in?
  end

  def seller
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
end
