require 'rails_helper'

describe "transactions endpoints" do
  context "GET /transactions" do
    it "returns a list of all transactions" do

      create_list(:transaction, 3)

      get "/api/v1/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(3)
    end
  end

  context "GET /transactions/:id" do
    it "returns a specific transaction" do
      transaction_1 = create(:transaction, credit_card_number: "now")
      transaction_2 = create(:transaction, credit_card_number: "never")

      get "/api/v1/transactions/#{transaction_2.id}"

      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction["credit_card_number"]).to eq("never")
    end
  end

  context "GET /transactions/find?parameters" do
    it "returns a single result based on params" do
      transaction_1 = create(:transaction, credit_card_number: "now")
      transaction_2 = create(:transaction, credit_card_number: "never")

      get "/api/v1/transactions/find?credit_card_number=never"

      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction["credit_card_number"]).to eq("never")
    end
  end

  context "GET /transactions/find_all?parameters" do
    it "returns all the results based on params" do
      transaction_1 = create(:transaction, credit_card_number: "now")
      transaction_2 = create(:transaction, credit_card_number: "never")
      transaction_2 = create(:transaction, credit_card_number: "never")

      get "/api/v1/transactions/find_all?credit_card_number=never"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(2)
    end
  end

  context "GET /transactions/random" do
    it "returns a random transaction" do
      transaction_1 = create(:transaction, credit_card_number: "now")
      transaction_2 = create(:transaction, credit_card_number: "never")

      get "/api/v1/transactions/random"

      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction.class).to eq(Hash)
    end
  end
end
