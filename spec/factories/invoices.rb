FactoryBot.define do
  factory :invoice do
    association :customer, factory: :random_customer
    association :merchant, factory: :random_merchant
    status { "shipped" }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
