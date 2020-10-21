FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length:6)}
    password_confirmation  {password}
    family_name            {Faker::Name.last_name}
    first_name             {Faker::Name.first_name}
    family_name_kana       {"カタカナ"}
    first_name_kana        {"カタカナ"}
    birth_day              {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end