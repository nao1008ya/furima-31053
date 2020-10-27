FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 4) }
    email { Faker::Internet.free_email }
    password = '1a2b3c'
    password { password }
    password_confirmation { password }
    first_name { Gimei.first.kanji }
    last_name { Gimei.last.kanji }
    first_kana_name { Gimei.first.katakana }
    last_kana_name { Gimei.last.katakana }
    birthday { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
