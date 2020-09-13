FactoryBot.define do
  factory :item do
    association :user
    name { 'Recorder' }
    description { 'test' }
    category_id { 1 }
    status_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    waiting_date_id { 1 }
    price { 3000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filername: 'test_image.png')
    end
  end
end
