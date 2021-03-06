class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  def index
    render json: Customer.customers_with_pending_invoices(params[:merchant_id])
  end
end
