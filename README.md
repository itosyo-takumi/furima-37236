# テーブル設計

## user テーブル

| Column             | Type   | Options       |
| ------------------ | ------ | --------------|
| nickname           | string | null: false   |
| email              | string | null: false   |
| encrypted_password | string | null: false   |
| family_name        | text   |               |
| first_name         | string | null: false   |
| family_name_kana   | string | null: false   |
| first_name_kana    | string | null: false   |
| birth_day          | date   | null: false   |


### Association

 has_many :products 
 belongs_to :purchase
 belongs_to :destination
 

## purchase テーブル

| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| user_id     | integer    | null: false,foreign_key:true |
| product_id  | references | null: false,foreign_key:true |


### Association

 belong_to :users
 


## destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase         | references | null: false,foreign_key:true   |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     |                                |


### Association

belongs_to :user


## productテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| category_id      | integer    | null: false,foreign_key:true   |
| user_id          | integer    | null: false,foreign_key:true   |


### Association

belongs_to :user
