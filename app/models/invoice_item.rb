class InvoiceItem < ApplicationRecord
  belongs_to :item, dependent: :destroy
  belongs_to :invoice, dependent: :destroy
  delegate :merchant, to: :item, :allow_nil => true

  def convert_price
    self.unit_price / 100
  end

  def total
    self.unit_price * self.quantity
  end
end
