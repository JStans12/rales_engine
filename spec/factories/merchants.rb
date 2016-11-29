FactoryGirl.define do
  factory :merchant do
    name "Joey"
    factory :merchant_with_invoices do
      invoices { create_list(:invoice, 4) }
    end
  end
end
