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

