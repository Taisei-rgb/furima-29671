class ItemsController < ApplicationController
  before_action :unless_login_user, only: :new

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show 
    @item = Item.find(params[:id])
  end

  def edit; end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :prefecture_id, :shipping_fee_id, :status_id, :waiting_date_id, :name, :description, :price, :image).merge(user_id: current_user.id)
  end

  def unless_login_user
    redirect_to root_path unless user_signed_in?
  end
end
