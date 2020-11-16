FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    postage_payer_id { 2 }
    prefecture_code_id { 2 }
    days_to_ship_id { 2 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
