FactoryGirl.define do
  factory :invoice do
    status "shipped"
    customer
    merchant
    factory :invoice_with_invoice_items do
      invoice_items { create_list(:invoice_item, 3) }
    end
  end
end
