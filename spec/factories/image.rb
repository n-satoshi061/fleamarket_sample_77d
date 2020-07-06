FactoryBot.define do
  factory :image do
    image      {File.open("./app/assets/images/test.jpg")}
  end
end