FactoryGirl.define do
  factory :item do
    name "Joey"
    description "This is the story all about how..."
    unit_price 50
    merchant
    factory :item_with_invoice_items do
      invoice_items { create_list(:invoice_item, 3) }
    end
  end
end
