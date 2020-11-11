class ItemTagRelation < ApplicationRecord
  # アソシエーションを設定
  belongs_to :item
  belongs_to :tag
end
