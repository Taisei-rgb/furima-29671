class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_seller, only: :index
  before_action :redirect_seller, only: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  def find_seller
    @item = Item.find(params[:item_id])
  end
  
  def redirect_seller
    if @item.user_id ==  current_user.id
      redirect_to root_path
    end
  end
end