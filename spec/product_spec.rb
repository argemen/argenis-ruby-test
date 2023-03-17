require_relative '../lib/product'

RSpec.describe Product do
  describe "#initialize" do
    context "when the Product is not exempt and not imported" do
      it "calculates the correct sales tax" do
        product = Product.new(1, "book", 12.99, false, false)
        expect(product.sales_tax.round(2)).to eq(1.30)
      end

      it "calculates the correct total price" do
        product = Product.new(1, "book", 12.99, false, false)
        expect(product.total_price.round(2)).to eq(14.29)
      end
    end

    context "when the Product is exempt" do
      it "does not calculate sales tax" do
        product = Product.new(1, "book", 12.99, true, false)
        expect(product.sales_tax.round(2)).to eq(0)
      end

      it "calculates the correct total price" do
        product = Product.new(2, "book", 12.99, true, false)
        expect(product.total_price.round(2)).to eq(25.98)
      end
    end

    context "when the Product is imported" do
      it "calculates the correct import tax" do
        product = Product.new(1, "imported book", 12.99, true, true)
        expect(product.import_tax.round(2)).to eq(0.65)
      end

      it "calculates the correct total price" do
        product = Product.new(1, "imported book", 12.99, true, true)
        expect(product.total_price.round(2)).to eq(13.64)
      end
    end
  end
end