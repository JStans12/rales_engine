require 'rails_helper'

describe "most_items" do
  it "returns most_items for all merchants" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)
    invoice = create(:invoice_with_invoice_items, merchant_id: merchant.id)
    invoice_3 = create(:invoice_with_invoice_items, merchant_id: merchant_3.id)
    invoice_3 = create(:invoice_with_invoice_items, merchant_id: merchant_3.id)
    transaction = create(:transaction, invoice_id: invoice.id)
    transaction_3 = create(:transaction, invoice_id: invoice_3.id)
    transaction_3 = create(:transaction, invoice_id: invoice_3.id)

    get "/api/v1/merchants/most_items?quantity=2"

    merchs = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchs.count).to eq(2)
    expect(merchs.last["id"]).to eq(merchant.id)
    expect(merchs.first["id"]).to eq(merchant_3.id)

  end
end
