class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :status
  belongs_to_active_hash :waiting_date

  validates :name, :description, :price, :image, presence: true

  validates :category_id, :prefecture_id, :shipping_fee_id, :status_id, :waiting_date_id,
  numericality: { other_than: 0 }
end
