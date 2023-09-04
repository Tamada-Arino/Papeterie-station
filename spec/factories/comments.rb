FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user_id { 1 }
    product_id { 1 }
  end
end
