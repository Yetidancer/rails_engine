class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description

  attribute :merchant do |object|
    merchant = Merchant.find(params[object.merchant_id])
    merchant.name
  end
end
