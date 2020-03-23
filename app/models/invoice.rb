class Invoice < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  belongs_to :merchant, dependent: :destroy
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
end
