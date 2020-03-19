class InvoiceItem < ApplicationRecord
  belongs_to :item, dependent: :destroy
  belongs_to :invoice, dependent: :destroy

  def convert_price
    self.unit_price / 100
  end
end
