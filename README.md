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
| email              | string | null: false  |
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

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| user_id       | integer | null: false, foreign_key: true | 
| item          | string  | null: false                    |  
| title         | string  | null: false                    |  
| description   | string  | null: false                    | 
| price         | integer | null: false                    |  
| image         | string  | null: false                    | 
| category      | string  | null: false                    |  
| condition     | string  | null: false                    | 
| shipping_cost | string  | null: false                    |  
| area          | string  | null: false                    |  
| days          | string  | null: false                    |  

### Association

- has_one :items
- has_one :orders
- has_many :shipping

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post        | string     | null: false                    |  
| ken         | string     | null: false                    |  
| village     | string     | null: false                    |  
| address     | string     | null: false                    |  
| explanation | string     | null: false                    |  
| telephone   | string     | null: false                    |  
| user_id     | references | null: false, foreign_key: true |  


### Association

- belongs_to :item
- has_many :order

## shipping テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buy     | references | null: false, foreign_key: true |
| name    | references | null: false, foreign_key: true |

### Association

- belongs_to :orders