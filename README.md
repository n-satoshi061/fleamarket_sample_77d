# フリマアプリ「フリマ」
![トップ画像](app/assets/images/スクリーンショット 2020-08-27 14.28.23.png)

## 概要
既存アプリのクローンをチーム開発の題材として作成しました。
スクラムによるアジャイル開発を経験し、Ruby on Railsの技術面だけでなく、チームでコミュニケーションを取って開発することの重要性や報連相の大切さを学び、個人で学習しているだけでは絶対に経験できないチームとしての経験を積むことができました。

### URL
<http://54.95.241.145/>
basic認証  
user: admin  
password: password

### テストアカウント
購入者用アカウント  
メールアドレス: buyer@gmail.com  
パスワード: buyer00  
出品者用アカウント  
メールアドレス: seller00@gmail.com  
パスワード: seller00

## 機能一覧
・ユーザー登録、編集機能  
・ログイン、ログアウト機能  
・商品の出品、編集、削除機能  
・商品詳細表示(画像のスライダー機能)  
・商品購入機能  
・カテゴリー機能  
・マイページ

## 使用技術
### フロントエンド
・HTML  
・CSS  
・JavaScript(jQuery)

### サーバーサイド
・Ruby
・Ruby on Rails

### インフラ
・AWS
・EC2
・S3

### データベース
・MySQL

### その他
・Git GitHub

## 制作背景、学んだこと
プログラミングスクールのカリキュラムとしてチーム5人で取り組みました。
最初はGitの操作やコンフリクト対応、報連相などのコミュニケーションにかなり苦戦していましたが、今後実務においてチーム開発をする上で大切なことを学ぶことができました。
個人開発では味わえない技術力以上に必要不可欠なことだったと今振り返ると思います。
これらの経験を生かして、実務でも即戦力として活躍するための基盤ができたと思います。

## より詳しい説明文(担当箇所等)
<https://docs.google.com/document/d/1DgLtMx8bCCDYRYVwx-VM2AWXvRntW_q8wiCH91PCReE/edit?usp=sharing>


## DB設計
### Usersテーブル
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

#### Association
- has_one  :card
- has_many :products
- has_many :addresses


### Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|user|references|foreign_key: true, null: false|

#### Association
- belongs_to  :user


### Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|card_id|string|null: false|
|customer_id|t.string|null: false|
|user|references|foreign_key: true, null: false|

#### Association
- belongs_to :user


### Productsテーブル
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

#### Association
- has_many   :images
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- belongs_to :category


### Categories
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|ancestry|string|

#### Association
- has_many :products
- has_ancestry


### Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|foreign_key: true, null: false|

#### Association
- belongs_to :product, optional:true, dependent: :destroy
