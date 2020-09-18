FactoryBot.define do
  factory :user_address do
    post_number { "123-4567"}
    city { "彦根市" }
    house_number { "旭町" }
    phone_number { "09011111111" }
    prefecture_id { 25 }
  end
end