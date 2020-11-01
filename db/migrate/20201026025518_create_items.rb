class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # itemsテーブルのカラム表示
      t.string :title, null: false
      t.text :catch_copy, null: false
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_fee_day_id, null: false
      t.integer :price, null: false
      # 制約をつけることにより、外部キー（今回であればuser_id）がないとDBに保存できないようにする
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
