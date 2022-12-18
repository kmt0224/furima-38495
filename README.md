<!-- usersテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nick_name          | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| name               | string     | null: false                    |
| kana_name          | string     | null: false                    |
| birthday           | integer    | null: false                    |
<!-- アソシエーション -->
has_many :items
has_many :item_order

<!-- itemsテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| ship_from_id       | integer    | null: false                    |
| date_of_shipment_id| integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
<!-- アソシエーション -->
belongs_to             :user
has_one                :item_order
belongs_to_active_hash :category
belongs_to_active_hash :status
belongs_to_active_hash :shipping_fee
belongs_to_active_hash :ship_from
belongs_to_active_hash :date_of_shipment

<!-- item_orderテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |
<!-- アソシエーション -->
belongs_to :user
belongs_to :item
has_one    :address

<!-- addressテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| municipality       | string     | null: false                    |
| house_number       | integer    | null: false                    |
| building_name      | string     |                                |
| phone_number       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
<!-- アソシエーション -->
belongs_to :item_order