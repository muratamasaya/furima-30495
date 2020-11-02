FactoryBot.define do
  factory :order do
    card_number {4242424242424242}
    exp_month {3}
    exp_year {33}
    code {123}
    post_code {111-1111}
    prefecture_id {3}
    city {"都島"}
    address {"池袋３−１−１"}
    building_name {"共栄ビル"}
    phone_number {"00901111111"}
  end
end
