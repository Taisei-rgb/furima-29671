class UserAddress

  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number, :buy_id, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/}
  end
  
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end