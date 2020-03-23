FactoryBot.define do
  factory :invoice_item do
    association :item, factory: :random_item
    association :invoice, factory: :random_invoice
    quantity { rand(0..10) }
    unit_price { 10.00 }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
