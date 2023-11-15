# README

## users テーブル

|Column                      |Type  |Options                  |
|----------------------------|------|-------------------------|
|nickname                    |string|null: false              |
|email                       |string|null: false, unique: true|
|encrypted_password          |string|null: false              |
|confirm_encrypted_password  |string|null: false              |
|last_name                   |string|null: false              |
|first_name                  |string|null: false              |
|last_kana_name              |string|null: false              |
|first_kana_name             |string|null: false              |
|birthday                    |date  |null: false              |

### Association
- has_many :items
- has_many :purchase_records


## items

|Column                  |Type      |Options                       |
|------------------------|----------|------------------------------|
|name                    |string    |null: false                   |
|description             |text      |null: false                   |
|category_id             |integer   |null: false                   |
|condition_id            |integer   |null: false                   |
|shipping_fee_burden_id  |integer   |null: false                   |
|shipping_area_id        |integer   |null: false                   |
|days_until_shipping_id  |integer   |null: false                   |
|price                   |integer   |null: false                   |
|user                    |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase_record


## purchase_records テーブル

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user    |references|null: false, foreign_key: true|
|item    |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item 
- has_one :shipping_information


## shipping_informations

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|postal_code       |string    |null: false                   |
|prefecture        |string    |null: false                   |
|municipal_district|string    |null: false                   |
|street_address    |string    |null: false                   |
|building_name     |string    |------------------------------|
|tel               |string    |null: false,                  |
|user              |references|null: false,                  |

### Association
- belongs_to :purchase_record