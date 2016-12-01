class Item < ApplicationRecord
  default_scope { order(id: :desc) }

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.total_revenue(quantity)
    select('items.*,' 'sum(invoice_items.unit_price*invoice_items.quantity) AS total')
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 'success'})
    .group('id').unscope(:order)
    .order('total DESC').limit(quantity)
  end
end
