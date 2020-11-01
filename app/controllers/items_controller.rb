class ItemsController < ApplicationController
  # 各アクションが動く前にログインしているかしていないかを判断し、
  # ログインしていなければアクションを動かすことなくログインページが表示されるようするメソッド
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    # 記事一覧が新規投稿順に並ぶように記述
    @items = Item.order('created_at DESC')
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

  def edit
    # ルーティングからきてモデルから受け取ったparamsをviewsに流すその後updateへ
    # その為、インスタンス変数である@つける

    # 投稿者以外のユーザーが、投稿者専用のページに遷移できないように
    # 購入後の商品が編集ページへ推移できないように
    redirect_to action: :index if @item.buyer
    redirect_to action: :index unless @item.user.id == current_user.id
  end

  def update
    # updateで完結する為、@必要なし
    # 投稿後すぐにupdateにて更新する。validetesが絡むと必ずこのような記述になる。
    # if文を用いてページのアクセスを設定する。
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    # 投稿者以外のユーザーが、削除できないように
    if @item.user.id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :catch_copy, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_fee_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
