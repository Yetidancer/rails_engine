require 'rails_helper'

describe "Merchants API" do
  before (:each) do
    @merchant1 = create(:merchant, name: "Empire Today", created_at: "2020-02-27 14:53:59 UTC", updated_at: "2020-02-27 14:53:59 UTC")
    @merchant2 = create(:merchant, name: "KMart", created_at: "2020-01-27 14:53:60 UTC", updated_at: "2020-01-28 14:53:60 UTC")
    @merchant3 = create(:merchant, name: "Bubble Armpit", created_at: "2020-03-27 14:53:58 UTC", updated_at: "2020-03-27 14:53:58 UTC")
  end

  it 'can find merchant by name' do
    search_term = "mPi"

    get "/api/v1/merchants/find_one?name=#{search_term}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@merchant1.id.to_s)
  end

  it 'can find merchant by created_at' do
    date_time = "2020-03-27 14:53:58 UTC"

    get "/api/v1/merchants/find_one?created_at=#{date_time}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@merchant3.id.to_s)
  end

  it 'can find merchant by updated_at' do
    date_time = "2020-01-28 14:53:60 UTC"

    get "/api/v1/merchants/find_one?updated_at=#{date_time}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@merchant2.id.to_s)
  end

  it 'can find merchant by multiple parameters' do
    search_term = "MpI"
    date_time = "2020-03-27 14:53:58 UTC"

    get "/api/v1/merchants/find_one?name=#{search_term}&created_at=#{date_time}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"]["id"]).to eq(@merchant3.id.to_s)
  end

  it 'can find multiple merchants by name' do
    search_term = "mpi"

    get "/api/v1/merchants/find_all?name=#{search_term}"

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"].count).to eq(2)
  end
end
