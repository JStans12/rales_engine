FactoryGirl.define do
  factory :transaction do
    credit_card_number "123456"
    result "success"
    invoice
  end
end
