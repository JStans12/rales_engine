require 'rails_helper'

describe "items endpoints" do
  context "GET /items" do
    it "returns all the items" do
      create_list(:item, 3)

      get "/api/v1/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
    end
  end

  context "GET /items/:id" do
    it "returns a single item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      single_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(single_item["id"]).to eq (item.id)
    end
  end

  context "GET /items/find?parameters" do
    it "returns a single result based on params" do
      item_1 = create(:item, name: "Chase")
      item_2 = create(:item, name: "Bob")

      get "/api/v1/items/find?name=Chase"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["name"]).to eq("Chase")
    end
  end

  context "GET /items/find_all?parameters" do
    it "returns all results based on params" do
      item_1 = create(:item, name: "Chase")
      item_2 = create(:item, name: "Bob")
      item_3 = create(:item, name: "Bob")

      get "/api/v1/items/find_all?name=Bob"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(2)
    end
  end

  context "GET /items/random" do
    it "returns a random item" do
      item_1 = create(:item, name: "Chase")
      item_2 = create(:item, name: "Bob")
      item_3 = create(:item, name: "John")

      get "/api/v1/items/random"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item.class).to eq(Hash)
    end
  end
end
