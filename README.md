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
- has_many :purchases
- has_many :comments

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category          | integer    | null: false                    |
| condition         | integer    | null: false                    |
| postage_payer     | integer    | null: false                    |
| prefecture_code   | integer    | null: false                    |
| days_to_ship      | integer    | null: false                    |
| price             | string     | null: false                    |
| user_id           | integer    | null: false, foreign_key: true |

### Association

- has_one :purchases
- belongs_to :users
- has_many   :comments

## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture_code  | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     | null: false                    |
| phone_number     | string     | null: false                    |


### Association
- has_one :purchase


## purchases テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | integer    | null: false, foreign_key: true |
| item_id           | integer    | null: false, foreign_key: true |
| destination_id    | integer    | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
- belongs_to :destinations

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :item
