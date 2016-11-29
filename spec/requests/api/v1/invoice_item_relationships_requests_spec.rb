require 'rails_helper'

describe "invoice items relationships endpoints" do
  context "GET /:id/invoice" do
    it "returns the invoice associated with the invoice item" do
      invoice_item = create(:invoice_item)
      invoice_id = invoice_item.invoice.id

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["id"]).to eq(invoice_id)
    end
  end

  context "GET /:id/item" do
    it "returns the item associated with the invoice item" do
      invoice_item = create(:invoice_item)
      item_id = invoice_item.item.id

      get "/api/v1/invoice_items/#{invoice_item.id}/item"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(item_id)
    end
  end
end
