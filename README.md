# README
　　https://gyazo.com/a358b4002c6abd0725abf22395b41f1d
![](https://gyazo.com/a358b4002c6abd0725abf22395b41f1d)

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
|tel|string|null: false|
|post_family_name|string|null: false|
|post_personal_name|string|null: false|
|post_family_name_kana|string|null: false|
|post_personal_name_kana|string|null: false|

### Association
- has_one  :card
- has_many :products
- has_many :addresses


## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|user|references|foreign_key: true, null: false|

### Association
- belongs_to  :user


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|card_id|string|null: false|
|customer_id|t.string|null: false|
|user|references|foreign_key: true, null: false|

### Association
- belongs_to :user


## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|from_area|string|null: false|
|delivery_person|boolean|null: false|
|delivery_leadtime|string|null: false|
|delivery_way|string|null: false|
|status|integer|null: false|
|user|references|foreign_key: true, null: false|
|category|references|foreign_key: true, null: false|
|buyer|references|foreign_key: {to_table: :users}|
|seller|references|foreign_key: {to_table: :users}, null: false|

### Association
- has_many   :images
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- belongs_to :category


## Categories
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|ancestry|string|

### Association
- has_many :products
- has_ancestry


## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|foreign_key: true, null: false|

### Association
- belongs_to :product, optional:true, dependent: :destroy
