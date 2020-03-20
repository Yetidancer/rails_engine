FactoryBot.define do
  factory :merchant do
    name { "Ball Factory" }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
