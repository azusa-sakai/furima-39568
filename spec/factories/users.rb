FactoryBot.define do
  factory :user do
    nickname {"Taro"}
    email {Faker::Internet.email}
    password {"techcamp11"}
    password_confirmation {password}
    last_name {"佐藤"}
    first_name {"きゃんぷ"}
    last_kana_name {"テック"}
    first_kana_name {"キャンプ"}
    birthday {"1989.9.6"}
  end
end