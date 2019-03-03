# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unipue: true|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer||

### Association(user)
- has_many :scores
- has_many :likes
- has_many :items, foreign_key: 'saler_id'
- has_many :comments
  has_one :profile, dependent: :destroy

## adressテーブル

|Colum|Type|Option|
|-----|----|------|
|postal_code|string||
|prefectures|string|null: false|
|city|string|null: false|
|number|string|null: false|
|building|string||
|user|references|foreign_key: true|

### Association(score)
- belongs_to: user

## itemsテーブル

|Colum|Type|Option|
|-----|----|------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|category|references|foreign_key: true|
|buyer_id|integer||
|saler_id|integer|null, false|
|shipping_date|references|foreign_key: true|
|condition|references|foreign_key: true|
|region|references|foreign_key: true|
|delivery_fee|references|foreign_key: true|
|ship_method|references|foreign_key: true|
|brand|references|foreign_key: true|
|size|references|foreign_key: true|
|trading|integer|null: false,default: 1|

### Association(item)
- belongs_to :size, optional:true
- belongs_to :shipping_date
- belongs_to :condition
- belongs_to :region
- belongs_to :ship_method ,optional: true
- belongs_to :delivery_fee
- belongs_to :category
- belongs_to :brand ,optional: true
- has_many :comments, dependent: :destroy
- has_many :item_photos, dependent: :destroy
- has_many :likes, dependent: :destroy
- accepts_nested_attributes_for :item_photos

## categoriesテーブル

|Colum|Type|Option|
|-----|----|------|
|name|integer|null:false|
|parent_id|integer|index: true|
|group|integer||

### Association(category)
- has_many :items

## sizesテーブル

|Colum|Type|Option|
|-----|----|------|
|type|integer|null: false, default: 0|
|group|integer||

### Association(size)
- has_many :items

## category_sizesテーブル

|Colum|Type|Option|
|-----|----|------|
|category|references|foreign_key: true|
|size|references|foreign_key: true|

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
|item|references|foreign_key: true|
|user|references|foreign_key: true|

### Association(transaction)
- belongs_to: user
- belongs_to: item

## likesテーブル

|Colum|Type|Option|
|-----|----|------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association(like)
- belongs_to: user belongs_to :item
  belongs_to :item

- belongs_to: item

## shipping_datesテーブル

|Colum|Type|Option|
|-----|----|------|
|day|integer|null: false|

### Association(shippng_date)
- has_many :items

## statesテーブル

|Colum|Type|Option|
|-----|----|------|
|type|string|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association(state)
- belongs_to: user
- belongs_to: item

## regionsテーブル

|Colum|Type|Option|
|-----|----|------|
|name|integer|null: false|

### Association(regions)
- has_many :items


## item_photosテーブル

|Colum|Type|Option|
|-----|----|------|
|photo|text|null: false|
|item|references|foreign_key: true|

### Association(item_photo)
  belongs_to :item

## delivery_feesテーブル

|Colum|Type|Option|
|-----|----|------|
|type|integer|null: false|

### Association(delivery_fee)
- has_many :items

## ship_methodsテーブル

|Colum|Type|Option|
|-----|----|------|
|type|integer|null: false|

### Association(ship_method)
- has_many :items

## scoresテーブル

|Colum|Type|Option|
|-----|----|------|
|type|integer|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association(score)
- belongs_to: user

## commentsテーブル

|Colum|Type|Option|
|-----|----|------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|comment|text||

### Association(comment)
- belongs_to: user
- belongs_to: item

## conditionsテーブル

|Colum|Type|Option|
|-----|----|------|
|type|integer|null: false|

### Association(condition)
- has_many: items

## profilesテーブル

|Colum|Type|Option|
|avator|text||
|comment|text||
|tel|string|unique: true|
|postal_code|string||
|prefectuer|string||
|city|string||
|number|string||
|building|string||
|user_id|integer||

### Association(profile)
- belongs_to: user

