FactoryBot.define do
  factory :favorite do
    user
    product

    user_id { user.id }
    product_id { product.id }
  end
end
