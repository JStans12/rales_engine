class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  private

  def invoice_item_params
    params[:unit_price] = (params[:unit_price].delete(".")).to_i if params[:unit_price]

    params.permit(:id, :quantity, :unit_price, :invoice_id, :item_id, :created_at, :updated_at)
  end
end
