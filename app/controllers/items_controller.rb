class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :prefecture_id, :shipping_fee_id, :status_id, :waiting_date_id,:name, :description, :price, :image).merge(user_id: current_user.id)
  end
end
