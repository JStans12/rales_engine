require 'rails_helper'

describe "model methods" do
  context "total_revenue" do
    it "returns total_revenue for specific merchant" do
      merchant = create(:merchant)
      invoice = create(:invoice_with_invoice_items, merchant_id: merchant.id)
      transaction = create(:transaction, invoice_id: invoice.id)

      get "/api/v1/merchants/#{merchant.id}/revenue"

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue["revenue"]).to eq("4.5")
    end
  end
end
