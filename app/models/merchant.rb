class Merchant < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def total_revenue(date)
    if date
      invoices.joins(:invoice_items, :transactions)
        .merge(Transaction.successful)
        .where(invoices: {created_at: date})
        .sum("invoice_items.unit_price*invoice_items.quantity")
    else
      invoices.joins(:invoice_items, :transactions)
        .merge(Transaction.successful)
        .sum("invoice_items.unit_price*invoice_items.quantity")
      end
  end

  def self.total_revenue_all(quantity)
    select('id', 'name', 'sum(invoice_items.unit_price*invoice_items.quantity) AS total')
    .joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: 'success'}).group('id')
    .unscope(:order).order('total DESC').limit(quantity)
  end

  def self.favorite_merchant(customer_id)
    joins(:invoices, :transactions)
    .where(invoices: {customer_id: customer_id}, transactions: {result: 'success'})
    .group('merchants.id').count
    .max_by { |k,v| v }.first
  end

  def self.most_items(quantity)
    select('merchants.id, merchants.name, sum(invoice_items.quantity) AS total_items_sold')
      .joins(invoices: [:transactions, :invoice_items])
      .where("transactions.result = 'success'")
      .group('id')
      .unscope(:order)
      .order('total_items_sold DESC')
      .limit(quantity)
  end
end
