class BuyersController < ApplicationController
  # 各アクションが動く前にログインしているかしていないかを判断し、
  # ログインしていなければアクションを動かすことなくログインページが表示されるようするメソッド
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @user_buyer = UserBuyer.new
    # ログインユーザーと出品者が同じ場合はトップページへ
    # 1度購入した商品は推移できないように
    if @item.user.id == current_user.id || @item.buyer
      redirect_to root_path
    end
    
  end

  def create
    @item = Item.find(params[:item_id])
    @user_buyer = UserBuyer.new(buyer_params)
    # バリデーションのチェックが行われる
     if @user_buyer.valid?
       pay_item
       @user_buyer.save
       redirect_to root_path
     else
       render action: :index
     end
  end


  private

  def buyer_params
    params.require(:user_buyer).permit(:postal_code, :prefecture_id, :city, :city_address, :apartment, :tel ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
