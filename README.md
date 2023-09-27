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
| email              | string | null: false,unique: true  |
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
| title         | string  | null: false                    |  
| description   | text    | null: false                    | 
| price         | integer | null: false                    |  
| category_id     | integer  | null: false                    |  
| condition_id     | integer  | null: false                    | 
| shipping_cost_id | integer  | null: false                    |  
| prefecture_id    | integer  | null: false                    | 
| today_id          | integer  | null: false                    |  

### Association

- belongs_to :user 
- has_one :shipping


## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post        | string     | null: false                    |  
| ken         | string     | null: false                    |  
| village     | string     | null: false                    |  
| explanation | string     | null: false                    |  
| telephone   | string     | null: false                    |  
| prefecture_id | integer | null: false                     |
| image         | string     | null: false                    | 
| price         | integer | null: false                     |  



### Association

- belongs_to :shipping

## shippings テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true | 

### Association

- belongs_to :item  
- has_one :order  
- belongs_to :user  