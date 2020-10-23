# テーブル設計
## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_kana_name | string | null: false |
| last_kana_name  | string | null: false |

# Active Hash
| birthday_year   |
| birthday_month  |
| birthday_day    |

### Association

- has_many :items
- has_many :buyers
- has_many :comments


## itemsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| catch_copy | text       | null: false |
| price      | integer    | null: false |
| user       | references | null: false |

# Active Hash
| category         |
| item_status      |
| shipping_fee     |
| prefectures_item |
| shipping_fee_day |

# Active Storage
| image |

### Association

- belong_to :user
- has_one :buyer
- has_many :comments

## buyersテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| credit_card   | integer    | null: false |
| security_code | integer    | null: false |
| postal_code   | integer    | null: false |
| city          | string     | null: false |
| city_address  | string     | null: false |
| apartment     | string     |             |
| tel           | integer    | null: false |
| user          | references | null: false |

# Active Hash
| time_limit_year   |
| time_limit_month  |
| prefectures_buyer |

### Association

- belong_to :user
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