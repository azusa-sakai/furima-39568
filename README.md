# README

## users テーブル

|Column                      |Type  |Options                  |
|----------------------------|------|-------------------------|
|nickname                    |string|null: false              |
|email                       |string|null: false, unique: true|
|encrypted_password          |string|null: false              |
|confirm_encrypted_password  |string|null: false              |
|name                        |string|null: false              |
|kana_name                   |string|null: false              |
|birthday                    |string|null: false              |

### Association
- has_many :items
- has_many :purchase_records


## items

|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|picture             |image     |null: false                   |
|name                |string    |null: false                   |
|description         |string    |null: false                   |
|category            |string    |null: false                   |
|condition           |string    |null: false                   |
|shipping_fee_burden |string    |null: false                   |
|shipping_area       |string    |null: false                   |
|days_until_shipping |string    |null: false                   |
|price               |integer   |null: false                   |
|user                |references|null: false, foreign_key: true|
|seller              |string    |null: false                   |

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
|postal_code       |integer   |null: false                   |
|prefecture        |string    |null: false                   |
|municipal_district|string    |null: false                   |
|street_address    |string    |null: false                   |
|building_name     |string    |------------------------------|
|tel               |integer   |null: false,                  |
|user              |references|null: false, foreign_key: true|

### Association
- has_one :purchase_record