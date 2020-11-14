class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :email, on: :create
    validates :birthday, on: :create_name
    #  パスワードに半角英数字を両方含める
    validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i }, on: :create
    # カラムが空且つ全角でないと保存できないというバリデーションを設定
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name, on: :create_name
      validates :last_name, on: :create_name
    end
    # カラムが空且つ全角カタカナでないと保存できないというバリデーションを設定
    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :first_kana_name, on: :create_name
      validates :last_kana_name, on: :create_name
    end
  end

  # アソシエーションを設定
  has_many :items
  has_many :buyers
  has_one :card, dependent: :destroy
  # has_many :comments
end
