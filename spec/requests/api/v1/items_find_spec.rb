require 'rails_helper'

describe 'Items API' do

  before :each do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    @item1 = create(:item, name: "Polly Pocket", description: "She's fabulous", unit_price: 22.75, merchant_id: @merchant1.id, created_at: "2020-02-27 14:53:59 UTC", updated_at: "2020-02-27 14:53:59 UTC")
    @item2 = create(:item, name: "Milk", description: "It's a bad choice", unit_price: 2.50, merchant_id: @merchant2.id, created_at: "2020-01-27 14:53:60 UTC", updated_at: "2020-01-28 14:53:60 UTC")
    @item3 = create(:item, name: "American Girl Doll", description: "She's American", unit_price: 48.01, merchant_id: @merchant1.id, created_at: "2020-03-27 14:53:58 UTC", updated_at: "2020-03-27 14:53:58 UTC")
  end

  it 'can find item by name' do
    search_term = "oll"

    get "/api/v1/items/find_one?name=#{search_term}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@item1.id.to_s)
  end

  it 'can find item by description' do
    search_term = "she"

    get "/api/v1/items/find_one?description=#{search_term}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@item1.id.to_s)
  end

  it 'can find item by unit_price' do
    unit_price = 2.50

    get "/api/v1/items/find_one?unit_price=#{unit_price}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@item2.id.to_s)
  end

  it 'can find item by merchant_id' do
    get "/api/v1/items/find_one?merchant_id=#{@merchant2.id}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@item2.id.to_s)
  end

  it 'can find item by created_at' do
    date_time = "2020-03-27 14:53:58 UTC"

    get "/api/v1/items/find_one?created_at=#{date_time}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@item3.id.to_s)
  end

  it 'can find item by updated_at' do
    date_time = "2020-01-28 14:53:60 UTC"

    get "/api/v1/items/find_one?updated_at=#{date_time}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@item2.id.to_s)
  end

  it 'can find item by multiple parameters' do
    search_term = "oll"
    date_time = "2020-03-27 14:53:58 UTC"
    unit_price = 48.01

    get "/api/v1/items/find_one?name=#{search_term}&created_at=#{date_time}&unit_price=#{unit_price}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@item3.id.to_s)
  end

end
