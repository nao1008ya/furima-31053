class CreateInputFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :input_formats do |t|
      # input_formatsテーブルのカラム表示
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :city_address, null: false
      t.string :apartment
      t.string :tel, null: false
      # 制約をつけることにより、外部キー（今回であればbuyer_id）がないとDBに保存できないようにする
      t.references :buyer, foreign_key: true
      t.timestamps
    end
  end
end
