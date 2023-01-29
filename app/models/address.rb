class Address < ApplicationRecord
  belongs_to :item_order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
