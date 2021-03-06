require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    it { should respond_to(:customer) }
    it { should respond_to(:merchant) }
    it { should respond_to(:transactions) }
    it { should respond_to(:invoice_items) }
    it { should respond_to(:items) }
  end
end
