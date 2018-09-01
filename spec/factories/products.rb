FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    sold_out false
    category 'sample'
    under_sale false
    price { Faker::Number.number(4) }
    sale_price { Faker::Number.number(3) }
    sale_text 'sample'
  end
end
