class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :house_number,  null: false
      t.string     :building_name, null: false
      t.string     :phone_number,  null: false
      t.string     :timestamps,    null: false
      t.references :item_order,    null: false, foreign_key: true
    end
  end
end
