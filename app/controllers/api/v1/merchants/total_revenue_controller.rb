class Api::V1::Merchants::TotalRevenueController < ApplicationController
  def index
    render json: Merchant.total_revenue_all(params[:quantity])
  end
end
