require 'rails_helper'

describe "revenue by date" do
  it "returns total revenue by date" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)
    invoice = create(:invoice_with_invoice_items, merchant_id: merchant.id, created_at: "2012-03-25 09:54:09 UTC")
    invoice_2 = create(:invoice_with_invoice_items, merchant_id: merchant_3.id, created_at: "2012-03-25 09:54:09 UTC")
    invoice_3 = create(:invoice_with_invoice_items, merchant_id: merchant_3.id)
    transaction = create(:transaction, invoice_id: invoice.id)
    transaction_3 = create(:transaction, invoice_id: invoice_3.id)
    transaction_3 = create(:transaction, invoice_id: invoice_3.id)

    get "/api/v1/merchants/revenue?date=2012-03-25 09:54:09 UTC"

    revenue = JSON.parse(response.body)

    expect(response).to be_success
    expect(revenue).to eq({"total_revenue"=>"4.5"})

  end
end
