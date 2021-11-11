FactoryBot.define do
  factory :item do
    name                  { 'hoge' }
    explanation           { Faker::Lorem.sentence }
    price                 { '9999' }
    status_id             { 2 }
    category_id           { 2 }
    area_id               { 2 }
    detail_id             { 2 }
    shipping_day_id       { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
