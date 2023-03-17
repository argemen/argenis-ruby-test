class Product
  attr_accessor :name, :price, :quantity, :sales_tax, :import_tax, :total_price

  def initialize(quantity, name, price, is_exempt, is_imported)
    @quantity = quantity
    @name = name
    @price = price.to_f * @quantity.to_i
    sales_tax = is_exempt ? 0 : (@price * 10/100.0).round(2)
    sales_tax = (sales_tax * 20).ceil/20.0
    import_tax = is_imported ? (@price * 5/100.0).round(2) : 0
    @import_tax = (import_tax * 20).ceil/20.0
    @sales_tax = sales_tax + @import_tax
    @total_price = @price + sales_tax + @import_tax
  end
end