class Merchant < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :items
  has_many :invoices

  def total_revenue
    invoices.joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .sum("invoice_items.unit_price*invoice_items.quantity")
  end
end
