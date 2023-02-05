class ItemOrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "Prefecture Select"}
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message:"is invalid."}
  end

  def save
    item_order = ItemOrder.create(
      user_id: user_id,
      item_id: item_id
    )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,  municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, item_order_id: item_order.id)
  end
end