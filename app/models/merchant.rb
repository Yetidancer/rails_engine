class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoice_items, through: :items
  has_many :invoices
  has_many :transactions, through: :invoices

  scope :filter_by_name, -> (name) { where("lower(name) like ?", "%#{name.downcase}%")}
  scope :filter_by_created_at, -> (created_at) { where("created_at = ?", "%#{created_at.upcase}%")}
  scope :filter_by_updated_at, -> (updated_at) { where("updated_at = ?", "%#{updated_at.upcase}%")}

  def self.ordered_revenue
    select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").joins(:invoice_items, :transactions).where(transactions: {result: "success"}).group(:id).order("revenue DESC")
  end

  def highest_revenue(limit)
    self.ordered_revenue.limit(limit)
  end
end
