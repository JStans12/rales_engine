class InvoiceItem < ApplicationRecord
  default_scope { order(id: :desc) }

  belongs_to :invoice
  belongs_to :item
end
