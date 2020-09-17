class UserAddress

  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number, :buy_id, :user_id, :item_id

  validates :post_number, :city, :house_number, :phone_number, presence: true

  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    binding.pry
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end