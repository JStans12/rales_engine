require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it { should respond_to(:invoices) }
  end
end
