FactoryBot.define do
  factory :item do
    name {"テスト"}
    description {"テスト"}
    category_id {"2"}
    condition_id {"2"}
    shipping_fee_burden_id {"2"}
    prefecture_id {"2"}
    days_until_shipping_id {"2"}
    price {"500"}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
