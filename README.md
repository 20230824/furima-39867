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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password 　　　　　　| string | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :shipping

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | string | null: false |
| image  | string | null: false |
| items  | string | null: false |
| title  | string | null: false |
| text   | string | null: false |
| price  | string | null: false |


### Association

- has_many :items
- has_many :orders
- has_many :shipping

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | references | null: false, foreign_key: true |
| card   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |
| text   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :orders
- belongs_to :shipping

## shipping テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     |                                |
| buy     | references | null: false, foreign_key: true |
| name    | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :orders
- belongs_to :shipping