class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :status
  belongs_to_active_hash :waiting_date

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :name, :description, :price, :image, presence: true

  validates :category_id, :prefecture_id, :shipping_fee_id, :status_id, :waiting_date_id,
            numericality: { other_than: 0 }
end
