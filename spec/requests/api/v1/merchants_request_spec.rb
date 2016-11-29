require 'rails_helper'

describe "merchants endpoints" do
  context "GET /merchants" do
    it "returns a list of all merchants" do

      create_list(:merchant, 3)

      get "/api/v1/merchants"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(3)
    end
  end

  context "GET /merchants/:id" do
    it "returns a specific merchant" do
      merchant_1 = create(:merchant, name: "test")
      merchant_2 = create(:merchant, name: "testing")

      get "/api/v1/merchants/#{merchant_2.id}"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["name"]).to eq("testing")
    end
  end

  context "GET /merchants/find?parameters" do
    it "returns a single result based on params" do
      merchant_1 = create(:merchant, name: "bill")
      merchant_2 = create(:merchant, name: "ted")

      get "/api/v1/merchants/find?name=bill"

      merchant= JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["name"]).to eq("bill")
    end
  end

  context "GET /merchants/find_all?parameters" do
    it "returns all the results based on params" do
      merchant_1 = create(:merchant, name: "bill")
      merchant_2 = create(:merchant, name: "ted")
      merchant_3 = create(:merchant, name: "ted")

      get "/api/v1/merchants/find_all?name=ted"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq(2)
    end
  end

  context "GET /merchants/random" do
    it "returns a random invoice" do
      merchant_1 = create(:merchant, name: "bill")
      merchant_2 = create(:merchant, name: "ted")

      get "/api/v1/merchants/random"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.class).to eq(Hash)
    end
  end
end
