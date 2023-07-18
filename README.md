# Furimaアプリ<br>
<br>
<br>
<br>

## 使い方<br>
### 会員登録<br>
新規登録ボタンから会員登録ができます<br>
<img width="1436" alt="トップページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/02c83e1d-9325-42c3-8292-436448f4dc3b"><br>
<img width="1430" alt="会員情報入力ページ2" src="https://github.com/kmt0224/furima-38495/assets/115336998/bc2aa0b4-429b-4b76-b709-ced9f30a42e6"><br>
<br>
<br>

会員情報を正しく入力し登録します<br>
<img width="1417" alt="会員情報入力ページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/3236954e-51ad-4a60-9549-eea43a625557"><br>
<br>
<br>

ログイン後、2要素認証の登録ができます<br>
<img width="1422" alt="ログイン後トップページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/f893265e-95fe-40de-9642-0f90e309c687"><br>
<br>
<br>

QRコードを表示し、認証コードを取得します<br>
<img width="1429" alt="2要素認証登録ページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/647e12d6-ab65-4cee-8488-09049c2a2a0c"><br>
<br>
<br>

GoogleAuthenticator等のアプリでQRコードを読み取ります<br>
認証コードを取得したら、認証画面へ戻り取得したコードを入力します<br>
<img width="1428" alt="QRコード表示ページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/448e80b3-9abf-4ce5-89cc-c47433b6f8ba"><br>
<br>
<br>

2要素認証の登録が完了し、トップページへ戻ります<br>
2要素認証は解除することもできます<br>
<img width="1434" alt="2要素認証登録後トップページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/a1b24475-3e28-45dc-b5a8-403686b3c2dd"><br>
<br>
<br>




## DB設計
<!-- usersテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nick_name          | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name        | string     | null: false                    |
| kana_first_name    | string     | null: false                    |
| kana_family_name   | string     | null: false                    | 
| birthday           | date       | null: false                    |
<!-- アソシエーション -->
has_many :items
has_many :item_orders

<!-- itemsテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| date_of_shipment_id| integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
<!-- アソシエーション -->
belongs_to             :user
has_one                :item_order
belongs_to_active_hash :category
belongs_to_active_hash :status
belongs_to_active_hash :shipping_fee
belongs_to_active_hash :prefecture
belongs_to_active_hash :date_of_shipment

<!-- item_ordersテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
<!-- アソシエーション -->
belongs_to             :user
belongs_to             :item
has_one                :address

<!-- addressesテーブル -->
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipality       | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| item_order         | references | null: false, foreign_key: true |
<!-- アソシエーション -->
belongs_to :item_order
belongs_to_active_hash :prefecture
