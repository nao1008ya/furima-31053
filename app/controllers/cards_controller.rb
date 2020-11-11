class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:card_token] # 登録しようとしているカード情報
    )
    # binding.pry
    card = Card.new( # トークン化されたカード情報を保存する
      card_token: customer.default_card, # カードトークン
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )
    if card.save
      redirect_to root_path
    else
      redirect_to "new" # カード登録画面
    end
  end

  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
 
    redirect_to new_card_path and return unless card.present?
 
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end
end
