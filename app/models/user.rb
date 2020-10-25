class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    #  パスワードに半角英数字を両方含める
    validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i }
    # カラムが空且つ全角でないと保存できないというバリデーションを設定
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
    end
    # カラムが空且つ全角カタカナでないと保存できないというバリデーションを設定
    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :first_kana_name
      validates :last_kana_name
    end
  end

  # itemsテーブルとbuyersテーブルとcommentsテーブルのアソシエーションを設定
  has_many :items
  # has_many :buyers
  # has_many :comments
end
