FactoryBot.define do
  factory :order_shipping do
    post_code                   { '123-4567' }
    prefecture_id               { 2 }
    municipalities              { '札幌市' }
    address                     { '222-2' }
    phone_number                { '08012345678' }
    token                       { 'tok_abcdefghijk00000000000000000' }
    user_id                     { '2' }
    item_id                     { '2' }
  end
end
