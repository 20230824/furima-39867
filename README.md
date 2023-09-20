# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name_kana    | string | null: false  |
| birthday           | string | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | string  | null: false, foreign_key: true |
| items       | string  | null: false                    | 
| title       | string  | null: false                    |
| text        | string  | null: false                    |
| price       | integer | null: false                    |
| image       | string  | null: false                    |
｜ explanation | string  | null: false                    |
｜ category   | string  | null: false                    |
｜ condition  | string  | null: false                    |
| charge      | string  | null: false                    |
| area        | string  | null: false                    |
| day|string  | string  | null: false                    |

### Association

- has_many :items
- has_many :orders
- has_many :shipping

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | references | null: false, foreign_key: true |
| card        | references | null: false, foreign_key: true |
| items_id    | references | null: false, foreign_key: true |
| explanation | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |
| post        | references | null: false, foreign_key: true |
| ken         | references | null: false, foreign_key: true |
| village     | references | null: false, foreign_key: true |
| address     | references | null: false, foreign_key: true |
｜ telephone  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order
- belongs_to :shipping

## shipping テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buy     | references | null: false, foreign_key: true |
| name    | references | null: false, foreign_key: true |

### Association

- belongs_to :orders