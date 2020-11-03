FactoryBot.define do
  factory :order do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { 111 - 1111 }
    prefecture_id { 3 }
    city { '都島' }
    address { '池袋３−１−１' }
    building_name { '共栄ビル' }
    phone_number { '00901111111' }
  end
end
