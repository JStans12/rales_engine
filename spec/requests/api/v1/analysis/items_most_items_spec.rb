require 'rails_helper'

describe "most_items" do
  it "returns top x items by number sold" do
    item = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    invoice = create(:invoice, items: [item, item_3])
    invoice_2 = create(:invoice, items: [item, item_2, item_3])
    transaction = create(:transaction, invoice_id: invoice.id)
    transaction_2 = create(:transaction, invoice_id: invoice_2.id)

    get "/api/v1/items/most_items?quantity=2"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(items).to_not include(item_2.id)
  end
end
