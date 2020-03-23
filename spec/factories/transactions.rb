FactoryBot.define do
  factory :transaction do
    association :invoice, factory: :random_invoice
    credit_card_number {}
    credit_card_expiration_date {}
    result { "success" }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
