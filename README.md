# テーブル設計

## users テーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル


| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| item_name          | string     | null: false                     |
| item_description   | text       | null: false                     |
| category           | string     | null: false                     |
| condition          | string     | null: false                     |
| delivery_charge    | integer    | null: false                     |
| ship_from          | string     | null: false                     |
| transport_days     | integer    | null: false                     |
| price              | integer    | null: false                     |
| seller_name        | string     | null: false                     |
| user_id            | references | null: false, foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル


| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| buyer_name         | string     | null: false                     |
| purchased_item     | string     | null: false                     |
| user_id            | references | null: false, foreign_key: true  |
| item_id            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :items
- has_one :shipping


## shippings テーブル


| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| post_code          | string     | null: false                     |
| prefectures        | string     | null: false                     |
| municipalities     | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| purchase_id        | references | null: false, foreign_key: true  |


### Association

- belongs_to :purchase
