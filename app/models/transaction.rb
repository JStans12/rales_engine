class Transaction < ApplicationRecord
  default_scope { order(id: :desc) }

  belongs_to :invoice

  def self.successful
    where(result: "success")
  end
end
