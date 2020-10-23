# テーブル設計
## usersテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| first_name      | string     | null: false |
| last_name       | string     | null: false |
| first_kana_name | string     | null: false |
| last_kana_name  | string     | null: false |
| birthday        | date       | null: false |

### Association

- has_many :items
- has_many :buyers
- has_many :comments


## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| title               | string     | null: false |
| catch_copy          | text       | null: false |
| price               | integer    | null: false |
| user_id             | references | null: false |
| buyer_id            | references | null: false |
| category_id         | integer    | null: false |
| item_status_id      | integer    | null: false |
| shipping_fee_id     | integer    | null: false |
| prefectures_item_id | integer    | null: false |
| shipping_fee_day_id | integer    | null: false |

### Association

- belong_to :user
- has_one :buyer
- has_one :input_format
- has_many :comments

## buyersテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | references | null: false |
| item_id | references | null: false |

### Association

- belong_to :user
- has_one :item
- has_one :input_format

## input_formatsテーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| postal_code          | string     | null: false |
| city                 | string     | null: false |
| city_address         | string     | null: false |
| apartment            | string     |             |
| tel                  | string     | null: false |
| item_id              | references | null: false |
| prefectures_buyer_id | integer    | null: false |

### Association

- has_one :buyer
- has_one :item

# ## commentsテーブル

# | Column | Type       | Options     |
# | ------ | ---------- | ----------- |
# | text   | text       | null: false |
# | user   | references | null: false |
# | item   | references | null: false |

# ### Association

# - belong_to :user
# - belong_to :items