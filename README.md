# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unipue: true|
|avator|text||
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|tel|string||
|birthday|integer||

### Association(user)
- has_many :buyed_items, foreign_key: "buyer_id", class_name: :Item
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: :Item
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: :Item
- has_many :transactions
- has_many :likes
- has_many :shipping_dates
- has_many :states
- has_many :regions
- has_many :item_photos
- has_many :delivery_fees
- has_many :ship_methods
- has_many :scores
- has_many :sizes
- has_many :comments
- has_one :adress

## adressテーブル

|Colum|Type|Option|
|-----|----|------|
|postal_code|string||
|prefectures|string|null: false|
|city|string|null: false|
|number|string|null: false|
|building|string||
|user_id|references|foreign_key: true|

### Association(score)
- belongs_to: user

## itemsテーブル

|Colum|Type|Option|
|-----|----|------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|category_id|references|foreign_key: true|
|buyer_id|references|foreign_key: true|
|saler_id|references|foreign_key: true|

### Association(item)
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :bland
- has_many :transactions
- has_many :likes
- has_many :shipping_dates
- has_many :states
- has_many :regions
- has_many :item_photos
- has_many :delivery_fees
- has_many :ship_methods
- has_many :comments
- has_many :sizes

## categoriesテーブル

|Colum|Type|Option|
|-----|----|------|
|name|string|null:false|
|item_id|references|foreign_key: true|
|parent_id|references|foreign_key: true|

### Association(category)
- has_many :items
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id
- has_many :category_sizes
- has_many :sizes, through: :category_sizes

## sizesテーブル

|Colum|Type|Option|
|-----|----|------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(size)
- belongs_to: user
- belongs_to: item
- has_many :category_sizes
- has_many :categories, through: :category_sizes

## category_sizesテーブル

|Colum|Type|Option|
|-----|----|------|
|category_id|references|foreign_key: true|
|size_id|references|foreign_key: true|

### Association(category_sizes)
- belongs_to :category
- belongs_to :size

## brandsテーブル

|Colum|Type|Option|
|-----|----|------|
|name|string|null: false|

### Association(brand)
- has_many :items

## transactionsテーブル

|Colum|Type|Option|
|-----|----|------|
|status|string|null: false|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association(transaction)
- belongs_to: user
- belongs_to: item

## likesテーブル

|Colum|Type|Option|
|-----|----|------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association(like)
- belongs_to: user
- belongs_to: item

## shipping_datesテーブル

|Colum|Type|Option|
|-----|----|------|
|days|string|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(shippng_date)
- belongs_to: user
- belongs_to: item

## statesテーブル

|Colum|Type|Option|
|-----|----|------|
|type|string|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(state)
- belongs_to: user
- belongs_to: item


## regionsテーブル

|Colum|Type|Option|
|-----|----|------|
|name|string|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(regions)
- belongs_to: user
- belongs_to: item


## item_photosテーブル

|Colum|Type|Option|
|-----|----|------|
|photo|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(item_photo)
- belongs_to: user
- belongs_to: item


## delivery_feesテーブル

|Colum|Type|Option|
|-----|----|------|
|type|boolean|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(delivery_fee)
- belongs_to: user
- belongs_to:
- has_many: ship_methods

## ship_methodsテーブル

|Colum|Type|Option|
|-----|----|------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(ship_method)
- belongs_to: user
- belongs_to: item
- belongs_to: delivery_fee

## scoresテーブル

|Colum|Type|Option|
|-----|----|------|
|type|string|null: false|
|user_id|references|foreign_key: true|

### Association(score)
- belongs_to: user

## commentsテーブル

|Colum|Type|Option|
|-----|----|------|
|text|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association(comment)
- belongs_to: user
- belongs_to: item

