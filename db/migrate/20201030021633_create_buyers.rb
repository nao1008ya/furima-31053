class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      # 制約をつけることにより、外部キー（今回であればuser_idとitem_id）がないとDBに保存できないようにする
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
