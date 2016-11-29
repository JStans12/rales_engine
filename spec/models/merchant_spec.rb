require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "relationships" do
    it { should respond_to(:items) }
    it { should respond_to(:invoices) }
  end
end
