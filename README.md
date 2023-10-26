# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| year               | string | null: false               |
| month              | string | null: false               |
| date               | string | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | text       | null: false                    |
| description       | text       | null: false                    |
| category          | string     | null: false                    |
| status            | string     | null: false,                   |
| burden_charge     | string     | null: false                    |
| regional          | string     | null: false                    |
| period            | string     | null: false                    |
| price             | string     | null: false                    |
| seller            | string     | null: false                    |
| user_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase



## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| purchaser | string     | null: false                    |
| purchase  | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address



## addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postcode     | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| block        | string     | null: false |
| building     | string     |             |
| phone_number | string     | null: false |


### Association

- belongs_to :purchase

