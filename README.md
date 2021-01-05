# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| explanation        | text       | null: false                     | 
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| postage_type_id    | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| preparation_day_id | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :order

## ordersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address1         | string     | null: false                    |
| address2         | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
