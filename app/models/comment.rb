class Comment < ApplicationRecord
  # カラムが空では保存できないというバリデーションを設定
  validates :text, presence: true
  # アソシエーション設定
  belongs_to :user
  belongs_to :item
end
