class Card < ApplicationRecord
  # アソシエーションを設定
  belongs_to :user
end
