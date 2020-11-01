class InputFormat < ApplicationRecord
  # アソシエーション設定
  belongs_to :buyer

  # # ActiveHashを使って作成したモデルに対してアソシエーションを設定する場合は、
  # # belongs_to_active_hashメソッドを使います。
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
end
