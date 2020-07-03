FactoryBot.define do 
  factory :product do
    title                     {"小橋"}
    introduction              {"逆水平"}
    price                     {"3000"}
    from_area                 {"大阪府"}
    delivery_person           {"送料込み(出品者負担)"}
    delivery_leadtime         {"3-4日で発送"}
    delivery_way              {"ゆうパック"}
    status                    {"新品、未使用"}
    category
    buyer_id                  {1}
    seller                    { create(:user) }
  end
end

# 画像は1枚以上必須
# 画像は複数枚投稿することができる
# 商品名が必須
# 商品の説明が必須
# カテゴリーの情報が必須
# ブランドについての情報は任意
# 商品の状態についての情報が必須
# 配送料の負担についての情報が必須
# 発送元の地域についての情報が必須
# 発送までの日数についての情報が必須
# 価格についての情報が必須
