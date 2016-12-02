require 'rails_helper'

describe "model methods" do
  context "most_revenue" do
    it "returns top x items by total revenue" do
      item = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      invoice = create(:invoice, items: [item, item_3], created_at: "2012-03-25 09:54:09 UTC")
      invoice_2 = create(:invoice, items: [item, item_2, item_3], created_at: "2012-03-25 09:54:09 UTC")
      invoice_3 = create(:invoice, items: [item_2] ,created_at: "2013-03-25 09:54:09 UTC")
      invoice_4 = create(:invoice, items: [item_2] ,created_at: "2013-03-25 09:54:09 UTC")
      transaction = create(:transaction, invoice_id: invoice.id)
      transaction_2 = create(:transaction, invoice_id: invoice_2.id)
      transaction_3 = create(:transaction, invoice_id: invoice_3.id)
      transaction_4 = create(:transaction, invoice_id: invoice_4.id)

      get "/api/v1/items/#{item_2.id}/best_day"

      bd = JSON.parse(response.body)

      expect(response).to be_success
      expect(bd["best_day"]).to eq("2012-03-25T09:54:09.000Z")
    end
  end
end
