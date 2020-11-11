class Item < ApplicationRecord
  # アソシエーション設定
  belongs_to :user
  has_one :buyer
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
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

  
end
