class Category < ApplicationRecord
  has_many :products
  
  validates :text,     presence: true

end

# - 画像は1枚以上必須
# - 画像は複数枚投稿することができる
# - 商品名が必須
# - 商品の説明が必須
# - カテゴリーの情報が必須
# - ブランドについての情報は任意
# - 商品の状態についての情報が必須
# - 配送料の負担についての情報が必須
# - 発送元の地域についての情報が必須
# - 発送までの日数についての情報が必須
# - 価格についての情報が必須