FactoryBot.define do
  factory :item do
    name { "Ball" }
    description { "It's round."}
    unit_price { 12.50 }
    merchant_id { create(:merchant).id }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
