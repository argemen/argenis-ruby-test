class Product
  attr_accessor :name, :price, :quantity, :sales_tax, :import_tax, :total_price

  def initialize(quantity, name, price, is_exempt, is_imported)
    @quantity = quantity
    @name = name
    @price = price.to_f * @quantity.to_i
    @sales_tax = is_exempt ? 0 : (@price * 0.1)
    @import_tax = is_imported ? (@price * 0.05) : 0
    @total_price = @price + @sales_tax + @import_tax
  end
end