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
| customer_id | string     | null: false                  |


### Association

 belong_to :users
 


## destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | integer    | null: false,foreign_key:true   |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
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
| price            | string     | null: false                    |
| description      | string     | null: false                    |
| status           | string     | null: false                    |
| shipping_cost    | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| prefecture_id    | string     | null: false                    |
| category_id      | integer    | null: false,foreign_key:true   |
| user_id          | integer    | null: false,foreign_key:true   |


### Association

belongs_to :user
