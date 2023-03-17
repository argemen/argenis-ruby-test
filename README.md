# Torc Ruby Test - Argemen
This project was developed on ruby language

# Folder structure
* lib: Includes the classes: Product, Receipt
* spec: Includes the tests

# Run the project
To run the project:\
Execute `bundle install` to load dependencies (rspec)\
Shell execute irb.

load the classes\
require_relative('product')\
require_relative('receipt')

Load the input for products\
input='2 book at 12.49\
1 music CD at 14.99\
1 chocolate bar at 0.85'\

To show the receipt:\
Receipt.new(input).show

# Testing
The project contains test files: Product test and receipt test.

To run the test, we go to the spec folder.\
To run product tests, just run the following command: `rspec product_spec.rb` \
To run receipt tests, execute the following command: `rspec receipt_spec.rb`

