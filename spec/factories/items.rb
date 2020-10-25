FactoryBot.define do
  factory :item do
    product { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { 5 }
    status_id { 6 }
    delivery_charge_id { 2 }
    prefecture_id { 3 }
    delivery_day_id { 3 }
    price { 5000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
