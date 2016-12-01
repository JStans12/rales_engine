class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    (object["total_revenue"]/100.00).to_s
  end
end
