class Item < ApplicationRecord
  belongs_to :merchant, dependent: :destroy

  def convert_price
    self.unit_price / 100
  end

end
