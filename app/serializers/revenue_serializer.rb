class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    (object["revenue"]/100.00).to_s
  end
end
