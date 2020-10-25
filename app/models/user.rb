class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #  パスワードに半角英数字を両方含める
  validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i }

  # カラムが空では保存できないというバリデーションを設定
  validates :nickname, presence: true

  # カラムが空且つ全角でないと保存できないというバリデーションを設定
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  # カラムが空且つ全角カタカナでないと保存できないというバリデーションを設定
  validates :first_kana_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :last_kana_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }

  # カラムが数字で生年月日のバリデーションを設定
  validates :birthday, presence: true

  # itemsテーブルとbuyersテーブルとcommentsテーブルのアソシエーションを設定
  has_many :items
  # has_many :buyers
  # has_many :comments
end
