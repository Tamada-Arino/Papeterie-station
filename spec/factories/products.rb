FactoryBot.define do
  factory :product do
    name { "test" }
    description { "test" }
    price { 1 }
    user_id { 1 }
    category_id { 1 }
  end
end
