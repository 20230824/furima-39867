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
| birthday           | date   | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| user          | references | null: false, foreign_key: true | 
| item          | string  | null: false                    |  
| title         | string  | null: false                    |  
| description   | text    | null: false                    | 
| price         | integer | null: false                    |  
| category_id     | integer  | null: false                    |  
| condition_id     | integer  | null: false                    | 
| shipping_cost_id | integer  | null: false                    |  
| area_id          | integer  | null: false                    |  
| days_id          | integer  | null: false                    |  

### Association

- has_one :shipping

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post        | string     | null: false                    |  
| area         | string     | null: false                    |  
| village     | string     | null: false                    |  
| address     | string     | null: false                    |  
| explanation | string     | null: false, foreign_key: true   |  
| telephone   | string     | null: false                    |  
| user　　     | references | null: false, foreign_key: true |  


### Association

- belongs_to :item
- has_one :order

## shipping テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_one :orders