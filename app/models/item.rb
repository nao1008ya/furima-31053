class Item < ApplicationRecord
  # アソシエーション設定
  belongs_to :user
  # has_one :buyer
  # has_many :comments

  # ActiveStorage 各レコードとファイルを1対1の関係で紐付けるメソッド
  has_one_attached :image

  # ActiveHashを使って作成したモデルに対してアソシエーションを設定する場合は、
  # belongs_to_active_hashメソッドを使います。
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee_day

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :title, :catch_copy, :image
    validates :category, :item_status, :shipping_fee, :prefecture, :shipping_fee_day
    # 価格の範囲が、¥300~¥9,999,999の間であること
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
      validates :price
    end
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_fee_day_id
  end
end
