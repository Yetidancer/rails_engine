FactoryBot.define do
  factory :customer do
    first_name { "Jerry"}
    last_name { "Garcia" }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
