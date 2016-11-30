class Transaction < ApplicationRecord
  default_scope { order(id: :desc) }

  belongs_to :invoice
end
