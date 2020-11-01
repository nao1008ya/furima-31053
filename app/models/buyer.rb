class Buyer < ApplicationRecord
  # アソシエーション設定
  belongs_to :user
  belongs_to :item
  has_one :input_format
end
