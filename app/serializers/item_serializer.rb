class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description

  attribute :merchant do |object|
    merchant = Merchant.find(object.merchant_id)
    merchant.name
  end
end
