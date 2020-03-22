require 'rails_helper'

describe "Merchants API" do

  it 'can find merchant by name' do
    merchant1 = create(:merchant, name: "Empire Today", created_at: "2020-02-27 14:53:59 UTC")
    merchant2 = create(:merchant, name: "KMart", created_at: "2020-01-27 14:53:60 UTC")
    merchant3 = create(:merchant, name: "Bubbles", created_at: "2020-03-27 14:53:59 UTC")

    search_term = merchant2.name.split('')[1..3].join.downcase

    get "/api/v1/merchants/find_one?name=#{search_term}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(merchant2.id.to_s)
  end

  it 'can find merchant by created_at' do
    merchant1 = create(:merchant, name: "Empire Today", created_at: "2020-02-27 14:53:59 UTC")
    merchant2 = create(:merchant, name: "KMart", created_at: "2020-01-27 14:53:60 UTC")
    merchant3 = create(:merchant, name: "Bubbles", created_at: "2020-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find_one?created_at=2020-03-27 14:53:59 UTC"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    # require "pry"; binding.pry

    expect(results["data"]["id"]).to eq(merchant3.id.to_s)
  end


end
