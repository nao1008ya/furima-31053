class ItemsTag

  include ActiveModel::Model
  attr_accessor :title, :catch_copy, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_fee_day_id, :price, :image, :name, :user_id

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :title, :catch_copy, :image
    validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_fee_day_id
    # 価格の範囲が、¥300~¥9,999,999の間であること
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
      validates :price
    end
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_fee_day_id
  end

  def save
    item = Item.new(title: title,catch_copy: catch_copy, category_id: category_id, item_status_id: item_status_id, shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, shipping_fee_day_id: shipping_fee_day_id, price: price, image: image, user_id: user_id)
    item.save
    binding.pry
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    # binding.pry
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end