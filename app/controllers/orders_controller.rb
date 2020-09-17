class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_seller, only: :index
  before_action :redirect_seller, only: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def create 
    @address = UserAddress.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def find_seller
    @item = Item.find(params[:item_id])
  end
  
  def redirect_seller
    if @item.user_id ==  current_user.id
      redirect_to root_path
    end
  end

  private

  def address_params
    params.permit(:token, :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_8a84cfb581594fb29d26ce18"
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency:'jpy'
    )
  end
end