FactoryBot.define do
  factory :comment do
    user
    product

    content { "test" }
    user_id { user.id }
    product_id { product.id }
  end
end
