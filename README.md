# README

![](https://i.gyazo.com/b6054659bb25147c8a8f216488c21144.png)

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|avatar|string||
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|family_name|string|null: false|
|personal_name|string|null: false|
|family_name_kana|string|null: false|
|personal_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|　　
|city|string|null: false|
|address|string|null: false|
|building|string||
|tel|integer||
|post_family_name|string|null: false|
|post_personal_name|string|null: false|
|post_family_name_kana|string|null: false|
|post_personal_name_kana|string|null: false|

### Association
- has_one  :card
- has_many :products


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|customer_id|t.string|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user


## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|user|references|foreign_key: true|
|from_area|string|null: false|
|product|references|foreign_key: true|
|delivery_leadtime|string|null: false|
|delivery_way|string|null: false|
|product|references|foreign_key: true|
|status|string|null: false|

### Association
- has_many   :images
- belongs_to :user
- has_many :categories, through: :product_categories
- has_many :product_categories


##Categories
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|product|references|foreign_key: true|

### Association
- belongs_to :product
- has_many :products, through: :product_categories
- has_many :product_categories


##Product_categories
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|product|references|foreign_key: true|
|category|references|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category


## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|foreign_key: true|

### Association
- belongs_to :product, optional:true, dependent: :destroy

