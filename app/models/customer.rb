class Customer < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_customer(merchant_id)
    joins(:invoices, :transactions)
    .where(invoices: {merchant_id: merchant_id}, transactions: {result: 'success'})
    .group('customers.id')
    .unscope(:order)
    .order('count(customers.id) DESC')
    .first
  end

  def self.customers_with_pending_invoices(merchant_id)
    m = Merchant.find(merchant_id)
    find((m.invoices - m.invoices.joins(:transactions)
    .where("transactions.result = 'success'"))
    .pluck(:customer_id))
  end
end
