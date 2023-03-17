require 'byebug'
class Receipt
  attr_accessor :products, :sales_tax_total, :total_cost

  def initialize(input)
    @products = []
    input.each_line do |line|
      parts = line.strip.split(' ')
      price = parts[-1].to_f
      is_imported = parts.include?('imported')
      is_exempt = ['book', 'books', 'food', 'chocolate', 'chocolates', 'medical', 'pills'].any? { |ex| parts.include?(ex) }
      product = Product.new(parts[0], parts[0...-2].join(' '), price, is_exempt, is_imported)
      @products << product
    end
    @sales_tax_total = @products.map(&:sales_tax).reduce(:+)
    @total_cost = @products.map(&:total_price).reduce(:+)
  end

  def tax_total
    @sales_tax_total.round(2)
  end

  def total_cost
    @total_cost.round(2)
  end

  def show
    @products.each do |product|
      puts "#{product.name}: #{'%.2f' % product.total_price}"
    end
    puts "Sales Taxes: #{'%.2f' % sales_tax_total}"
    puts "Total: #{'%.2f' % total_cost}"
  end
end