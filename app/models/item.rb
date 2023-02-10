class Item < ApplicationRecord
  belongs_to             :user
  has_one_attached       :image
  has_one                :item_order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :date_of_shipment

  validates :image,               presence: true, content_type: [:png, :jpg, :jpeg]
  validates :item,                presence: true
  validates :explanation,         presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :date_of_shipment_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,               presence: true,
                                  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
