FactoryBot.define do
  factory :invoice_item do
    customer_id { rand(0..10) }
    association :merchant, factory: :random_merchant
    status { "shipped" }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
