# テーブル設計

## users テーブル


| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchases


## items テーブル


| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| name               | string     | null: false                     |
| description        | text       | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| delivery_charge_id | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| transport_day_id   | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル


| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル


| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| post_code          | string     | null: false                     |
| prefecture_id      | integer    | null: false                     |
| municipalities     | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| purchase           | references | null: false, foreign_key: true  |


### Association

- belongs_to :purchase
