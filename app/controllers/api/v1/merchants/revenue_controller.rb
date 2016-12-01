class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    render json: {"revenue" => Merchant.find(params[:merchant_id]).total_revenue(params[:date])},
      serializer: RevenueSerializer
  end

end
