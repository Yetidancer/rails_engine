class Transaction < ApplicationRecord
  belongs_to :invoice, dependent: :destroy
  delegate :merchant, to: :invoice, :allow_nil => true
end
