class SaleItem < ActiveRecord::Base
  # Mass-storage settings.
  attr_accessible :quantity, :product_price
  
  belongs_to :product
  belongs_to :sale
end
