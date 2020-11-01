require 'rails_helper'

RSpec.describe UserBuyer, type: :model do
  before do
    @user_buyer = FactoryBot.build(:user_buyer, user_id: 1, item_id: 1)
  end

  describe '商品購入登録' do
    context '商品購入が上手くいくとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user_buyer).to be_valid
      end
      it '建物名がなくても登録できること' do
        @user_buyer.apartment = nil
        expect(@user_buyer).to be_valid
      end
    end

    context '商品出品が上手くいかないとき' do
      it 'tokenが空では登録できないこと' do
        @user_buyer.token = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できないこと' do
        @user_buyer.postal_code = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-が入っていなければ登録できないこと' do
        @user_buyer.postal_code = '1000011'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idがない場合は登録できないこと' do
        @user_buyer.prefecture_id = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1の場合は登録できないこと' do
        @user_buyer.prefecture_id = 1
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空では登録できないこと' do
        @user_buyer.city = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'city_addressが空では登録できないこと' do
        @user_buyer.city_address = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("City address can't be blank")
      end

      it 'telが空では登録できないこと' do
        @user_buyer.tel = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが半角数字以外では登録できないこと' do
        @user_buyer.tel = '０９０１１２２３３４４'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上では登録できないこと' do
        @user_buyer.tel = '090123456789'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end
    end
  end
end
