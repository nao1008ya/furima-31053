FactoryBot.define do
  factory :user_buyer do
    postal_code { '123-0011' }
    prefecture_id { 3 }
    city { Gimei.city.kanji }
    city_address { '1-1-1' }
    apartment { 'マンション' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
