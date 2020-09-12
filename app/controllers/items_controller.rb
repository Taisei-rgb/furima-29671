class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @items = Item.new(item_params)
  end

  def item_params
    params.require(:item).permit(:category_id, :prefecture_id, :shipping_fee_id, :status_id, :waiting_date_id)
  end
end
