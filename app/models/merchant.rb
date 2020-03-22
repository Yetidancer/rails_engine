class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy

  scope :filter_by_name, -> (name) { where("name like ?", "%#{name}%")}
end
