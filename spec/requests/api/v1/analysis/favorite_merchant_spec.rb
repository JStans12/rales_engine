require 'rails_helper'

describe "model methods" do
  context "favorite_merchant" do
    it "returns favorite_merchant for a specific customers" do
      merchant = create(:merchant)
      merchant_2 = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id)
      invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id)
      transaction = create(:transaction, invoice_id: invoice.id)
      transaction_2 = create(:transaction, invoice_id: invoice_2.id)
      transaction_3 = create(:transaction, invoice_id: invoice_3.id)

      get "/api/v1/customers/#{customer.id}/favorite_merchant"

      merch = JSON.parse(response.body)

      expect(response).to be_success
      expect(merch["id"]).to eq(merchant_2.id)
    end
  end
end
