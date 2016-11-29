require 'rails_helper'

describe "invoices relationship endpoints" do
  context "GET /:id/transactions" do
    it "returns a list of all transations associated with an invoice" do
      invoice = create(:invoice)
      5.times { invoice.transactions.create }

      get "/api/v1/invoices/#{invoice.id}/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(5)
    end
  end

  context "GET /:id/invoice_items" do
    it "returns a list of allinvoice_items associated with an invoice" do
      invoice = create(:invoice_with_invoice_items) #factory creates 3 invoice items

      get "/api/v1/invoices/#{invoice.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
    end
  end

  context "GET /:id/items" do
    it "returns a list of allinvoice_items associated with an invoice" do
      invoice = create(:invoice_with_invoice_items) #factory creates 3 invoice items each has one item

      get "/api/v1/invoices/#{invoice.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
    end
  end

  context "GET /:id/customer" do
    it "returns the customer associated with the invoice" do
      invoice = create(:invoice)
      customer_id = invoice.customer.id

      get "/api/v1/invoices/#{invoice.id}/customer"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["id"]).to eq(customer_id)
    end
  end

  context "GET /:id/merchant" do
    it "returns the merchant associated with the invoice" do
      invoice = create(:invoice)
      merchant_id = invoice.merchant.id

      get "/api/v1/invoices/#{invoice.id}/merchant"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(merchant_id)
    end
  end
end
