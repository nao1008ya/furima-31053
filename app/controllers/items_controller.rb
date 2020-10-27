class ItemsController < ApplicationController
  # 各アクションが動く前にログインしているかしていないかを判断し、
  # ログインしていなければアクションを動かすことなくログインページが表示されるようするメソッド
  before_action :authenticate_user!, except: [:index]

  def index
    # 記事一覧が新規投稿順に並ぶように記述
    # @items = Item.order('created_at DESC')
  end

  def new
    # 空の出品ページを作成。
    @item = Item.new
  end

  def create
    # 出品後すぐにsaveにて保存する。validetesが絡むと必ずこのような記述になる。
    # if文を用いてページのアクセスを設定する。
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :catch_copy, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_fee_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
