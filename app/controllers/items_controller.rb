class ItemsController < ApplicationController
  before_action :unless_login_user, only: :new
  before_action :find_item, only: %i[show edit update destroy] 

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.user_id == current_user.id
      @item.update(item_params)
      if @item.valid?
        redirect_to item_path(@item.id)
      else
        render action: :edit
      end
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :prefecture_id, :shipping_fee_id, :status_id, :waiting_date_id, :name, :description, :price, :image).merge(user_id: current_user.id)
  end

  def unless_login_user
    redirect_to root_path unless user_signed_in?
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
