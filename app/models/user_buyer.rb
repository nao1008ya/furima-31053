class UserBuyer
  include ActiveModel::Model
  # 保存したい複数のテーブルのカラム名全てを属性値として扱えるようにする
  attr_accessor :postal_code, :prefecture_id, :city, :city_address, :apartment, :tel, :user_id, :item_id, :buyer_id, :token

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :prefecture_id, :city, :city_address, :token
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    # 「住所」の電話番号に関するバリデーション
    validates :tel, format: { with: /[0-9]{10,11}/ }
  end
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 } 

  def save
    # 購入の情報を保存
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存し、「input_format」という変数に入れている
    # 先ほどの記述で定義したbuyerのidを持ってくる
    InputFormat.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, city_address: city_address, apartment: apartment, tel: tel, buyer_id: buyer.id)
  end
end