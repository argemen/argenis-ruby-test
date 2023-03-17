require_relative '../lib/product'
require_relative '../lib/receipt'

RSpec.describe Receipt do
  describe "#initialize" do
    context "when given a list of products" do
      it "calculates the correct sales tax total" do
        input = '2 book at 12.49
                 1 music CD at 14.99
                 1 chocolate bar at 0.85'
        receipt = Receipt.new(input)
        expect(receipt.tax_total).to eq(1.50)
      end

      it "calculates the correct total cost" do
        input = '2 book at 12.49
                 1 music CD at 14.99
                 1 chocolate bar at 0.85'
        receipt = Receipt.new(input)
        expect(receipt.total_cost).to eq(42.32)
      end
    end
  end
end