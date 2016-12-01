class Customer < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_customer(merchant_id)
    joins(:invoices, :transactions).
    where(invoices: {merchant_id: merchant_id}, transactions: {result: 'success'}).
    group('customers.id').count
    .max_by { |k,v| v }.first
  end
end
