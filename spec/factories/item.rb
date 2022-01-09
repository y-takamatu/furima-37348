FactoryBot.define do
  factory :item do
    name                      {'テスト'}
    description               {'テストテストテスト'}
    category_id               {2}
    condition_id              {2}
    delivery_charge_id        {2}
    prefecture_id             {2}
    transport_day_id          {2}
    price                     {2222}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

