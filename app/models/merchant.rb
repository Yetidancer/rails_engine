class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy

  scope :filter_by_name, -> (name) { where("lower(name) like ?", "%#{name.downcase}%")}
  scope :filter_by_created_at, -> (created_at) { where("created_at = ?", "%#{created_at.upcase}%")}
  scope :filter_by_updated_at, -> (updated_at) { where("updated_at = ?", "%#{updated_at.upcase}%")}
end
