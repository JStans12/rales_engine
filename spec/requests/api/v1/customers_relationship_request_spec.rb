require 'rails_helper'

describe "customers relationship endpoints" do
  context "GET /customers/:id/invoices" do
    it "returns all invoices associated with customer" do
      customer = create(:customer_with_invoices)

      get "/api/v1/customers/#{customer.id}/invoices"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(3)
    end
  end

  context "GET /customers/:id/transactions" do
    it "returns all transactions associated with customer" do
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id)
      transaction = create(:transaction, invoice_id: invoice.id)
      transaction_2 = create(:transaction, invoice_id: invoice.id)

      # transactions_all =

      get "/api/v1/customers/#{customer.id}/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(2)
    end
  end
end
