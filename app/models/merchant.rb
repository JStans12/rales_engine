class Merchant < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :items
  has_many :invoices

  def total_revenue
    invoices.joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .sum("invoice_items.unit_price*invoice_items.quantity")
  end

  def self.total_revenue_all(quantity)
    select('id', 'name', 'sum(invoice_items.unit_price*invoice_items.quantity) AS total')
    .joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: 'success'}).group('id')
    .unscope(:order).order('total DESC').limit(quantity)
  end
end
