class Item < ApplicationRecord
  belongs_to :merchant, dependent: :destroy
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  scope :filter_by_name, -> (name) { where("lower(name) like ?", "%#{name.downcase}%")}
  scope :filter_by_description, -> (description) { where("lower(description) like ?", "%#{description.downcase}%")}
  scope :filter_by_unit_price, -> (unit_price) { where("unit_price = ?", "#{unit_price}")}
  scope :filter_by_merchant_id, -> (merchant_id) { where("merchant_id = ?", "#{merchant_id}")}
  scope :filter_by_created_at, -> (created_at) { where("created_at = ?", "%#{created_at.upcase}%")}
  scope :filter_by_updated_at, -> (updated_at) { where("updated_at = ?", "%#{updated_at.upcase}%")}

  def convert_price
    self.unit_price / 100
  end

end
