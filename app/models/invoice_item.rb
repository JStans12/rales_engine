class InvoiceItem < ApplicationRecord
  default_scope { order(id: :desc) }

  belongs_to :invoice
  belongs_to :item

  def self.revenue_by_date(date)
    joins(invoice: :transactions)
    .where(invoices: {created_at: date})
    .where("transactions.result = 'success'")
    .sum('invoice_items.quantity*invoice_items.unit_price')
  end
end
