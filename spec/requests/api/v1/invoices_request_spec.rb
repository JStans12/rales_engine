require 'rails_helper'

describe "invoices endpoints" do
  context "GET /invoices" do
    it "returns a list of all invoices" do

      create_list(:invoice, 3)

      get "/api/v1/invoices"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(3)
    end
  end

  context "GET /invoices/:id" do
    it "returns a specific invoice" do
      invoice_1 = create(:invoice, status: "test")
      invoice_2 = create(:invoice, status: "testing")

      get "/api/v1/invoices/#{invoice_2.id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["status"]).to eq("testing")
    end
  end

  context "GET /invoices/find?parameters" do
    it "returns a single result based on params" do
      invoice_1 = create(:invoice, status: "test")
      invoice_2 = create(:invoice, status: "testing")

      get "/api/v1/invoices/find?id=#{invoice_2.id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["status"]).to eq("testing")
    end
  end

  context "GET /invoices/find_all?parameters" do
    it "returns all the results based on params" do
      invoice_1 = create(:invoice, status: "test")
      invoice_2 = create(:invoice, status: "bear")
      invoice_2 = create(:invoice, status: "bear")

      get "/api/v1/invoices/find_all?status=bear"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(2)
    end
  end

  context "GET /invoices/random" do
    it "returns a random invoice" do
      invoice_1 = create(:invoice, status: "test")
      invoice_2 = create(:invoice, status: "bear")
      invoice_2 = create(:invoice, status: "tiger")

      get "/api/v1/invoices/random"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice.class).to eq(Hash)
    end
  end
end
