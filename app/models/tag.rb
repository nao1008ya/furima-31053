class Tag < ApplicationRecord

  # アソシエーションを設定
  has_many :item_tag_relations
  has_many :items, through: :item_tag_relations
  # 一度保存したタグを保存できなくする
  validates :name, uniqueness: true
end
