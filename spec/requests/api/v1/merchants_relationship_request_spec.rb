require 'rails_helper'

describe "merchants relationship endpoints" do
  context "GET /merchants/:id/items" do
    it "returns a collection of associated items" do
      merchant = create(:merchant)
      3.times {merchant.items.create}

      get "/api/v1/merchants/#{merchant.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
    end
  end

  context "GET /merchants/:id/invoices" do
    it "returns a collection of invoices" do
      merchant = create(:merchant_with_invoices)

      get "/api/v1/merchants/#{merchant.id}/invoices"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(4)
    end
  end
end
