class Item < ApplicationRecord
  default_scope { order(id: :desc) }

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.total_revenue(quantity)
    select('items.*,' 'sum(invoice_items.unit_price*invoice_items.quantity) AS total')
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group('id')
    .unscope(:order)
    .order('total DESC')
    .limit(quantity)
  end

  def self.most_items_sold(quantity)
    select('items.*, sum(invoice_items.quantity) AS total_sold')
      .joins(invoices: [:transactions])
      .merge(Transaction.successful)
      .group('id')
      .unscope(:order)
      .order('total_sold DESC')
      .limit(quantity)
  end

  def best_day
    invoices.select('invoices.*, count(invoices.created_at) AS day')
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .group('id')
    .unscope(:order)
    .order('day DESC').first
  end
end
