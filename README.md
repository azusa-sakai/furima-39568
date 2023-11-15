# README

## users テーブル

|Column              |Type  |Options                  |
|--------------------|------|-------------------------|
|name                |string|null: false, unique: true|
|email               |string|null: false              |
|encrypted_password  |string|null: false              |

### Association
- has_many :items
- has_many :purchase_record


## items

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|name    |string    |null: false                   |
|price   |string    |null: false                   |
|user_id |references|null: false, foreign_key: true|
|seller  |string    |null: false                   |

### Association
- belongs_to :users
- has_one :purchase_record


## purchase_record テーブル

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user_id |references|null: false, foreign_key: true|
|item_id |references|null: false, foreign_key: true|

### Association
- belongs_to :users
- has_one :items 


## shipping information

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user_id |references|null: false, foreign_key: true|
|address |string    |null: false                   |

### Association
- has_one :purchase_record