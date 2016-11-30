class Customer < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :invoices
  has_many :transactions, through: :invoices
end
