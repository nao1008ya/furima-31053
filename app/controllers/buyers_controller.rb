class BuyersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  # 各アクションが動く前にログインしているかしていないかを判断し、
  # ログインしていなければアクションを動かすことなくログインページが表示されるようするメソッド
  before_action :authenticate_user!
  def index
    #binding.pry
    pay_item_new
    @user_buyer = UserBuyer.new
    # ログインユーザーと出品者が同じ場合はトップページへ
    # 1度購入した商品は推移できないように
    redirect_to root_path if @item.user.id == current_user.id || @item.buyer
  end

  def create
    @user_buyer = UserBuyer.new(buyer_params)
    # バリデーションのチェックが行われる
    if @user_buyer.valid?
      pay_item_key
      @user_buyer.save
      redirect_to root_path
    else
      pay_item_new
      render action: :index
    end
  end

  private

  def buyer_params
    params.require(:user_buyer).permit(:postal_code, :prefecture_id, :city, :city_address, :apartment, :tel).merge(user_id: current_user.id, item_id: params[:item_id]) #token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # クレジットカード入力
  # def pay_item
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #   Payjp::Charge.create(
  #     amount: @item.price, # 商品の値段
  #     card: buyer_params[:token], # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end

  def pay_item_key
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
   customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
   Payjp::Charge.create(
     amount: @item.price, # 商品の値段
     customer: customer_token, # 顧客のトークン
     currency: 'jpy' # 通貨の種類（日本円）
     )
  end

  def pay_item_new
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end
end
