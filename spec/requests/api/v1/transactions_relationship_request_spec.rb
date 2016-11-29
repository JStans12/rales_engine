require 'rails_helper'

describe "transactions relationship endpoints" do
  context "GET /transactions/:id/invoice" do
    it "returns an invoice associated with transaction" do
      transaction = create(:transaction)
      invoice_id = transaction.invoice.id

      get "/api/v1/transactions/#{transaction.id}/invoice"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["id"]).to eq(invoice_id)
    end
  end
end
