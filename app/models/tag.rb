class Tag < ApplicationRecord

  # アソシエーションを設定
  has_many :item_tag_relations
  has_many :items, through: :item_tag_relations
end
