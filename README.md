# Furimaアプリ<br>
<br>
<br>
<br>

## 使い方<br>
### 会員登録<br>
新規登録ボタンから会員登録ができます。<br>
<img width="1436" alt="トップページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/02c83e1d-9325-42c3-8292-436448f4dc3b"><br>
<br>
<br>

会員情報を正しく入力し登録します。<br>
<img width="1417" alt="会員情報入力ページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/3236954e-51ad-4a60-9549-eea43a625557"><br>
<img width="1437" alt="会員情報入力ページ2" src="https://github.com/kmt0224/furima-38495/assets/115336998/a3b3daea-7069-45f5-b354-3e669a303a12"><br>
<br>
<br>

ログイン後、2要素認証の登録ができます。<br>
<img width="1422" alt="ログイン後トップページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/f893265e-95fe-40de-9642-0f90e309c687"><br>
<br>
<br>

QRコードを表示し、認証コードを取得します。<br>
<img width="1429" alt="2要素認証登録ページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/647e12d6-ab65-4cee-8488-09049c2a2a0c"><br>
<br>
<br>

GoogleAuthenticator等のアプリでQRコードを読み取ります。<br>
認証コードを取得したら、認証画面へ戻り取得したコードを入力します。<br>
<img width="1428" alt="QRコード表示ページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/448e80b3-9abf-4ce5-89cc-c47433b6f8ba"><br>
<br>
<br>

2要素認証の登録が完了し、トップページへ戻ります。<br>
2要素認証は解除することもできます。<br>
<img width="1434" alt="2要素認証登録後トップページ" src="https://github.com/kmt0224/furima-38495/assets/115336998/a1b24475-3e28-45dc-b5a8-403686b3c2dd"><br>
<br>
<br>
<br>

### 出品<br>
出品ボタンをクリックし出品画面に遷ります。<br>
<img width="1436" alt="出品ボタン" src="https://github.com/kmt0224/furima-38495/assets/115336998/0774a5a9-20a3-4cc4-9557-7bf21c4e7049"><br>
<br>
<br>

画像を添付し、必要事項を入力すると出品できます。<br>
<img width="1440" alt="出品画面" src="https://github.com/kmt0224/furima-38495/assets/115336998/43dd1205-f78c-49b9-8182-d46ecbbf63ca"><br>
<img width="1436" alt="出品画面2" src="https://github.com/kmt0224/furima-38495/assets/115336998/59951a4e-bb2e-441f-b9bc-b8fed3f55dac"><br>
<br>
<br>

出品が完了すると、トップページ下部に商品リストが表示されます。<br>
商品をクリックすると、商品詳細ページに遷ります。<br>
<img width="1436" alt="出品リスト" src="https://github.com/kmt0224/furima-38495/assets/115336998/af073fb8-5f5f-4e68-9b4f-008689a99df0"><br>
<br>
<br>

自身が出品した商品の詳細画面では、出品中の商品の編集・削除が行えます。<br>
<img width="1421" alt="出品者商品詳細画面" src="https://github.com/kmt0224/furima-38495/assets/115336998/7b0b1953-f6c8-4b12-bb33-295777661ddf"><br>
<br>
<br>

編集画面では内容を変更し、変更するボタンをクリックすると、商品内容の変更ができます。<br>
もどるをクリックすると、変更は破棄され商品詳細画面に戻ります。<br>
<img width="1435" alt="商品編集画面" src="https://github.com/kmt0224/furima-38495/assets/115336998/6dc87186-b58a-4773-a663-20b403d298be"><br>
<br>
<br>
<br>

### 購入<br>
他人の出品した商品をクリックすると、商品詳細画面に遷り、商品の購入ができます。<br>
<img width="1435" alt="購入者商品詳細画面" src="https://github.com/kmt0224/furima-38495/assets/115336998/2c26c80e-5d6b-4e54-aa91-8f74a9dc7c72"><br>
<br>
<br>

購入画面では、必要事項を入力すると商品の購入ができます。<br>
※サンプルアプリなのでカード情報は下記の通りでご利用できます。<br>
<!-- -->
|      カード番号       | 有効期限 | CVC |
| ------------------- | ------- | --- |
| 4242 4242 4242 4242 |  12/24  | 123 |
<!-- -->

<img width="1425" alt="商品購入画面" src="https://github.com/kmt0224/furima-38495/assets/115336998/d682719f-1dc0-4c9f-a7ad-cbb45f4a4f2e"><br>
<img width="1426" alt="商品購入画面2" src="https://github.com/kmt0224/furima-38495/assets/115336998/00ba8d94-81e6-4604-81a4-e86a4756b527"><br>
<br>
<br>

商品購入が終了するとsold outのラベルがつきます。<br>
<img width="1431" alt="購入済み商品" src="https://github.com/kmt0224/furima-38495/assets/115336998/b234946e-971d-4dc0-94e2-30cc98ac332e"><br>
<br>
<br>
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
