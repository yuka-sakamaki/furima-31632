## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_katakana  | string | null: false |
| first_name_katakana | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| postage_payer_id  | integer    | null: false                    |
| prefecture_code_id| integer    | null: false                    |
| days_to_ship_id   | integer    | null: false                    |
| price             | string     | null: false                    |
| user_id           | integer    | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user
- has_many   :comments

## addresses テーブル

| Column             | Type       | Options                        |
| ----------------   | ---------- | ------------------------------ |
| post_code_id       | integer    | null: false                    |
| prefecture_code_id | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | string     | null: false                    |
| order_id           | integer    | null: false, foreign_key: true |


### Association
- belongs_to :order


## orders テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | integer    | null: false, foreign_key: true |
| item_id           | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :item
