require 'rails_helper'

describe "Merchant revenues" do
  before :each do
    @customer1 = create(:customer)
    @merchant1 = create(:merchant, name: "Empire Today", created_at: "2020-02-27 14:53:59 UTC", updated_at: "2020-02-27 14:53:59 UTC")
    @merchant2 = create(:merchant, name: "KMart", created_at: "2020-01-27 14:53:60 UTC", updated_at: "2020-01-28 14:53:60 UTC")
    @merchant3 = create(:merchant, name: "Bubble Armpit", created_at: "2020-03-27 14:53:58 UTC", updated_at: "2020-03-27 14:53:58 UTC")
    @item1 = create(:item, name: "Polly Pocket", description: "She's fabulous", unit_price: 22.75, merchant_id: @merchant1.id, created_at: "2020-02-27 14:53:59 UTC", updated_at: "2020-02-27 14:53:59 UTC")
    @item2 = create(:item, name: "Milk", description: "It's a bad choice", unit_price: 2.50, merchant_id: @merchant2.id, created_at: "2020-01-27 14:53:60 UTC", updated_at: "2020-01-28 14:53:60 UTC")
    @item3 = create(:item, name: "American Girl Doll", description: "She's American", unit_price: 48.01, merchant_id: @merchant1.id, created_at: "2020-03-27 14:53:58 UTC", updated_at: "2020-03-27 14:53:58 UTC")
    @invoice1 = create(:invoice, merchant_id: @merchant1.id, customer_id: @customer1.id)
    @invoice2 = create(:invoice, merchant_id: @merchant2.id, customer_id: @customer1.id)
    @invoice3 = create(:invoice, merchant_id: @merchant1.id, customer_id: @customer1.id)
    @invoice_item1 = create(:invoice_item, item_id: @item1.id, invoice_id: @invoice1.id, quantity: 2, unit_price: @item1.unit_price)
    @invoice_item2 = create(:invoice_item, item_id: @item3.id, invoice_id: @invoice1.id, quantity: 2, unit_price: @item3.unit_price)
    @invoice_item3 = create(:invoice_item, item_id: @item2.id, invoice_id: @invoice2.id, quantity: 2, unit_price: @item2.unit_price)
    @invoice_item4 = create(:invoice_item, item_id: @item3.id, invoice_id: @invoice3.id, quantity: 2, unit_price: @item3.unit_price)
    @transaction1 = create(:transaction, invoice_id: @invoice1.id)
    @transaction2 = create(:transaction, invoice_id: @invoice2.id)
    @transaction3 = create(:transaction, invoice_id: @invoice3.id)
  end

  it 'can calculate revenue for a merchant' do
    amount1 = @invoice_item1.quantity * @invoice_item1.unit_price
    amount2 = @invoice_item2.quantity * @invoice_item2.unit_price
    amount3 = @invoice_item4.quantity * @invoice_item4.unit_price

    total = (amount1 + amount2 + amount3)

    get "/api/v1/merchants/#{@merchant1.id}/revenue"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["attributes"]["revenue"]).to eq(total.round(2))
  end

end
