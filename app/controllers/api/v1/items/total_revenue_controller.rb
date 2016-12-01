class Api::V1::Items::TotalRevenueController < ApplicationController
  def index
    render json: Item.total_revenue(params[:quantity])
  end
end
