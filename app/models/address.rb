class Address < ApplicationRecord
  belongs_to :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :post_number, :city, :house_number, :phone_number, presence: true

  validates :prefecture_id, numericality: { other_than: 0 }
end
