FactoryBot.define do

  factory :address do
    postal_code     {"000-1111"}
    prefecture      {"愛知県"}
    city            {"名古屋市"}
    block           {"1-1-1"}
    building        {"マンション101"}
    user_id            {"1"}
  end
end
