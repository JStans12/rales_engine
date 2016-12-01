class Merchant < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def total_revenue
    invoices.joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .sum("invoice_items.unit_price*invoice_items.quantity")
  end

  def self.favorite_merchant(customer_id)
    joins(:invoices, :transactions)
    .where(invoices: {customer_id: customer_id}, transactions: {result: 'success'})
    .group('merchants.id').count
    .max_by { |k,v| v }.first
  end
end
