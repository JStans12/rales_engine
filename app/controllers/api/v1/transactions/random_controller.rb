class Api::V1::Transactions::RandomController < ApplicationController
  def show
    random = rand(Transaction.count + 1)
    render json: Transaction.find(random)
  end
end
