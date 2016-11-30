require 'rails_helper'

describe "invice items endpoints" do
  context "GET /invoice_items" do
    it "returns a list of all invoice_items" do
      create_list(:invoice_item, 3)

      get "/api/v1/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
    end
  end

  context "GET /invoice_items/:id" do
    it "returns a single invoice_item" do
      invoice_item_1 = create(:invoice_item, quantity: 4)
      invoice_item_2 = create(:invoice_item, quantity: 5)

      get "/api/v1/invoice_items/#{invoice_item_2.id}"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item["quantity"]).to eq(5)
    end
  end

  context "GET /invoice_items/find?parameters" do
    it "returns a single invoice item based on params" do
      invoice_item_1 = create(:invoice_item, quantity: 4, unit_price: 20)
      invoice_item_2 = create(:invoice_item, quantity: 5, unit_price: 30)

      get "/api/v1/invoice_items/find?quantity=5"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item["unit_price"]).to eq("0.3")
    end
  end

  context "GET /invoice_items/find_all?parameters" do
    it "returns all the invoice item based on params" do
      invoice_item_1 = create(:invoice_item, quantity: 4, unit_price: 20)
      invoice_item_2 = create(:invoice_item, quantity: 5, unit_price: 30)
      invoice_item_3 = create(:invoice_item, quantity: 5, unit_price: 45)

      get "/api/v1/invoice_items/find_all?quantity=5"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(2)
    end
  end

  context "GET /invoice_items/random" do
    it "returns a random invoice item" do
      invoice_item_1 = create(:invoice_item, quantity: 4, unit_price: 20)
      invoice_item_2 = create(:invoice_item, quantity: 5, unit_price: 30)
      invoice_item_3 = create(:invoice_item, quantity: 6, unit_price: 45)

      get "/api/v1/invoice_items/random"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice.class).to eq(Hash)
    end
  end
end
