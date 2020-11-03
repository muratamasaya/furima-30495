class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :seller, only: [:index]
  before_action :sold, only: [:index]
  before_action :locate, only: [:index, :create]

  def index
    @order_item = OrderItem.new
    locate
  end

  def create
    locate
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

  def seller
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end

  def locate
    @item = Item.find(params[:item_id])
  end
end
