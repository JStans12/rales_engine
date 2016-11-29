require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "relationships" do
    it { should respond_to(:invoice) }
  end
end
