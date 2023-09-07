FactoryBot.define do
  factory :post do
    association :user
    association :room

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
