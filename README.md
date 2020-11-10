## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_katakana  | string | null: false |
| first_name_katakana | string | null: false |
| birth_year          | date   | null: false |
| birth_month         | date   | null: false |
| birth_day           | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category          | string     | null: false                    |
| status            | string     | null: false                    |
| postage_payer     | string     | null: false                    |
| shipping_method   | string     | null: false                    |
| prefecture_code   | string     | null: false                    |
| days_to_ship      | string     | null: false                    |
| price             | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- has_one    :orders
- belongs_to :users
- has_many   :comments

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | string     | null: false                    |
| expiration_year  | string     | null: false                    |
| expiration_month | string     | null: false                    |
| security_code    | string     | null: false                    |
| post_code        | string     | null: false                    |
| prefecture_code  | string     | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     | null: false                    |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| room             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :item
