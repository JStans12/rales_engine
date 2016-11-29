class Api::V1::Customers::RandomController < ApplicationController
  def show
    random = rand(Customer.count + 1)
    render json: Customer.find(random)
  end
end
