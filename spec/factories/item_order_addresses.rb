FactoryBot.define do
  factory :item_order_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '0312345678' }
    token {'tok_abcdefghijk00000000000000000'}
  end
end
