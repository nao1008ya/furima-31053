# テーブル設計
## usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_kana_name    | string     | null: false |
| last_kana_name     | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many :items
- has_many :buyers
- has_many :comments
- has_one :card, dependent: :destroy


## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| title               | string     | null: false |
| catch_copy          | text       | null: false |
| price               | integer    | null: false |
| user                | references | null: false |
| category_id         | integer    | null: false |
| item_status_id      | integer    | null: false |
| shipping_fee_id     | integer    | null: false |
| prefecture_id       | integer    | null: false |
| shipping_fee_day_id | integer    | null: false |

### Association

- belongs_to :user
- has_one :buyer
- has_many :item_tag_relations
- has_many :tags, through: :item_tag_relations
- has_many :comments

## tagsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |

### Association

- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations

## items_tagテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| tag    | references | null: false |
| item   | references | null: false |

### Association

- belongs_to :tag
- belongs_to :item

## buyersテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| item   | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :input_format

## input_formatsテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| city          | string     | null: false |
| city_address  | string     | null: false |
| apartment     | string     |             |
| tel           | string     | null: false |
| buyer         | references | null: false |
| prefecture_id | integer    | null: false |

### Association

- belongs_to :buyer

## cardsテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_token     | string     | null: false |
| customer_token | string     | null: false |
| user           | references | null: false |

### Association

- belongs_to :user

# ## commentsテーブル

# | Column | Type       | Options     |
# | ------ | ---------- | ----------- |
# | text   | text       | null: false |
# | user   | references | null: false |
# | item   | references | null: false |

# ### Association

# - belongs_to :user
# - belongs_to :items