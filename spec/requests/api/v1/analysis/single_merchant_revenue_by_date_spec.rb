require 'rails_helper'

describe "model methods" do
  context "single_merchants_most_revenue" do
    it "returns most_revenue for one_merchant" do
      merchant = create(:merchant)
      merchant_2 = create(:merchant)
      invoice = create(:invoice_with_invoice_items, merchant_id: merchant.id, created_at: "2012-03-25 09:54:09 UTC")
      invoice_2 = create(:invoice_with_invoice_items, merchant_id: merchant.id, created_at: "2012-03-27 09:54:09 UTC")
      invoice_3 = create(:invoice_with_invoice_items, merchant_id: merchant_2.id, created_at: "2012-03-25 09:54:09 UTC")
      invoice_4 = create(:invoice_with_invoice_items, merchant_id: merchant.id, created_at: "2012-03-25 09:54:09 UTC")
      transaction = create(:transaction, invoice_id: invoice.id)
      transaction_2 = create(:transaction, invoice_id: invoice_2.id)
      transaction_3 = create(:transaction, invoice_id: invoice_3.id)
      transaction_4 = create(:transaction, invoice_id: invoice_4.id)

      get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-25 09:54:09 UTC"

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue.count).to eq(1)
      expect(revenue["revenue"]).to eq("9.0")
    end
  end
end
