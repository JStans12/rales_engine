require 'rails_helper'

describe "items relationships endpoints" do
  context "GET /:id/invoice_items" do
    it "returns a lits of all invoice items associated" do
      item = create(:item_with_invoice_items)

      get "/api/v1/items/#{item.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
    end
  end

  context "GET /:id/merchant" do
    it "returns the merchant associated with the item" do
      item = create(:item)
      merchant_id = item.merchant.id

      get "/api/v1/items/#{item.id}/merchant"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(merchant_id)
    end
  end
end
