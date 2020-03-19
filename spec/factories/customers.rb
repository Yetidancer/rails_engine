FactoryBot.define do
  factory :customer do
    first_name { "Manut" }
    last_name { "Bol" }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
