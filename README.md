# テーブル設計

## users テーブル

| Column              | Type      | Options       |
| ------------------- | --------- | ------------- |
| nickname            | string    | null: false   |
| email               | string    | null: false   |
| encrypted_password  | string    | null: false   |
| lastname            | string    | null: false   |
| firstname           | string    | null: false   |
| lastname_japanese   | string    | null: false   |
| firstname_japanese  | string    | null: false   |
| birthday            | string    | null: false   |

### Association
has_many :items


## items テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| image               | string      | null: false                    |
| name                | string      | null: false                    |
| info                | string      | null: false                    |
| item_status         | string      | null: false                    |
| delivery_fee        | string      | null: false                    |
| precture            | string      | null: false                    |
| read_time           | string      | null: false                    |
| price               | string      | null: false                    |
| user                | references  | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :buy


## buys テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| credit_card_number  | string      | null: false                    |
| dead_line           | string      | null: false                    |
| security_code       | string      | null: false                    |
| postal_code         | string      | null: false                    |
| city                | string      | null: false                    |
| address             | string      | null: false                    |
| build_name          | string      | null: false                    |
| phone_number        | string      | null: false                    |
| item                | references  | null: false, foreign_key: true |

### Association
belongs_to :item