# テーブル設計

## users テーブル

| Column              | Type      | Options                    |
| ------------------- | --------- | -------------------------- |
| nickname            | string    | null: false                |
| email               | string    | null: false, unique: true  |
| encrypted_password  | string    | null: false                |
| lastname            | string    | null: false                |
| firstname           | string    | null: false                |
| lastname_japanese   | string    | null: false                |
| firstname_japanese  | string    | null: false                |
| birthday            | date      | null: false                |

### Association
has_many :items
has_many :buys


## items テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| info                | text        | null: false                    |
| category_id         | integer     | null: false                    |
| item_status_id      | integer     | null: false                    |
| delivery_fee_id     | integer     | null: false                    |
| prefecture_id       | integer     | null: false                    |
| read_time_id        | integer     | null: false                    |
| price               | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :buy

extend ActiveHash::Associations::ActuveRecordExtensions
belongs_to :category
belongs_to :item_status
belongs_to :delivery_fee
belongs_to :prefecture
belongs_to :read_time



## buys テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| user                | references  | null: false, foreign_key: true |
| item                | references  | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :residence


## residences テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| postal_code         | string      | null: false                    |
| prefecture_id       | integer     | null: false                    |
| city                | string      | null: false                    |
| address             | string      | null: false                    |
| build_name          | string      |                                |
| phone_number        | string      | null: false                    |
| buy                 | references  | null: false, foreign_key: true |


### Association
belongs_to :buy
belongs_to :prefecture