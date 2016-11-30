class Merchant < ApplicationRecord
  default_scope { order(id: :desc) }

  has_many :items
  has_many :invoices
end
