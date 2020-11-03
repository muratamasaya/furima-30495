FactoryBot.define do
  factory :order_item do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '150-0044' }
    prefecture_id { 3 }
    city { '都島' }
    address { '池袋３−１−１' }
    building_name { '共栄ビル' }
    phone_number { '09011111111' }
    user_id { 2 }
    item_id { 3 }
  end
end
