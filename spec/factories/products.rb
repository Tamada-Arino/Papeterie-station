FactoryBot.define do
  factory :product do
    user
    category

    name { "test" }
    description { "test" }
    price { 1 }
    user_id { user.id }
    category_id { category.id }
  end
end
