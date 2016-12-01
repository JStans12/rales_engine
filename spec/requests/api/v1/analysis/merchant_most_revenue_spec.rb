require 'rails_helper'

describe "model methods" do
  context "most_revenue" do
    it "returns most_revenue for all merchants" do
      merchant = create(:merchant)
      merchant_2 = create(:merchant)
      merchant_3 = create(:merchant)
      invoice = create(:invoice_with_invoice_items, merchant_id: merchant.id)
      invoice_3 = create(:invoice_with_invoice_items, merchant_id: merchant_3.id)
      transaction = create(:transaction, invoice_id: invoice.id)
      transaction_3 = create(:transaction, invoice_id: invoice_3.id)

      get "/api/v1/merchants/most_revenue?quantity=2"

      merchs = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchs.count).to eq(2)
      expect(merchs).to_not include(merchant_2.id)

    end
  end
end
