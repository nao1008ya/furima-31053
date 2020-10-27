FactoryBot.define do
  factory :item do
    title { Faker::Name.initials(number: 4) }
    catch_copy { Faker::Lorem.sentence }
    category_id { 3 }
    item_status_id { 3 }
    shipping_fee_id { 2 }
    prefecture_id { 3 }
    shipping_fee_day_id { 2 }
    price { Faker::Number.number(digits: 5) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
