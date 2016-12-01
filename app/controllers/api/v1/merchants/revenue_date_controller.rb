class Api::V1::Merchants::RevenueDateController < ApplicationController

  def show
    render json: { "total_revenue" => InvoiceItem.revenue_by_date(params[:date]) },
      serializer: TotalRevenueSerializer
  end

end
