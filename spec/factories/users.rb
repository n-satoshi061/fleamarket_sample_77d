FactoryBot.define do

  factory :user do
    avatar                    {"test.jpg"}
    nickname                  {"taro"}
    email                     {"rspec_test@gmail.com"}
    password                  {"1234567a"}
    password_confirmation     {"1234567a"}
    birthyear                 {"2000"}
    birthmonth                {"12"}
    birthday                  {"31"}
    family_name               {"田中"}
    personal_name             {"太郎"}
    family_name_kana          {"タナカ"}
    personal_name_kana        {"タロウ"}
    tel                       {"000-1111-2222"}
    post_family_name          {"田中"}
    post_personal_name        {"太郎"}
    post_family_name_kana     {"タナカ"}
    post_personal_name_kana   {"タロウ"}
  end
end
