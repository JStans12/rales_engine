require 'rails_helper'

describe "model methods" do
  context "favorite_customer" do
    it "returns favorite_customer for a specific merchant" do
      merchant = create(:merchant)
      customer = create(:customer)
      customer_2 = create(:customer)
      invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      invoice_3 = create(:invoice, customer_id: customer_2.id, merchant_id: merchant.id)
      transaction = create(:transaction, invoice_id: invoice.id)
      transaction_2 = create(:transaction, invoice_id: invoice_2.id)
      transaction_3 = create(:transaction, invoice_id: invoice_3.id)

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"

      cust = JSON.parse(response.body)

      expect(response).to be_success
      expect(cust["id"]).to eq(customer.id)
    end
  end
end
