require 'rails_helper'

describe "customers endponts" do
  context "GET /customers" do
    it "returns a list of all customers" do

      create_list(:customer, 3)

      get "/api/v1/customers"

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq(3)
    end
  end

  context "GET /customers/:id" do
    it "returns a specific customer" do
      customer_1 = create(:customer, first_name: "bob")
      customer_2 = create(:customer, first_name: "tom")

      get "/api/v1/customers/#{customer_2.id}"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["first_name"]).to eq("tom")
    end
  end

  context "GET /customers/find?parameters" do
    it "returns a single result based on params" do
      customer_1 = create(:customer, first_name: "bob")
      customer_2 = create(:customer, first_name: "tom")

      get "/api/v1/customers/find?first_name=tom"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["first_name"]).to eq("tom")
    end
  end

  context "GET /customers/find_all?parameters" do
    it "returns all the results based on params" do
      customer_1 = create(:customer, first_name: "bob")
      customer_2 = create(:customer, first_name: "tom")
      customer_2 = create(:customer, first_name: "tom")

      get "/api/v1/customers/find_all?first_name=tom"

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq(2)
    end
  end

  context "GET /customers/random" do
    it "returns a random customer" do
      customer_1 = create(:customer, first_name: "bob")
      customer_2 = create(:customer, first_name: "tom")

      get "/api/v1/customers/random"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer.class).to eq(Hash)
    end
  end
end
