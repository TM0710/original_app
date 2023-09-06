FactoryBot.define do
  factory :room do
    name { Faker::Commerce.product_name }
    room_path { Faker::Internet.password }
    wedding_day { Faker::Date.birthday }
  end
end
