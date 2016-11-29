class Api::V1::Merchants::RandomController < ApplicationController
  def show
    random = rand(Merchant.count + 1)
    render json: Merchant.find(random)
  end
end
