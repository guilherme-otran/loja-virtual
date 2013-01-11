class Item
  attr_accessor :product_id, :quantity
  
  def initialize(product_id)
    @product_id = product_id
    @quantity = 1
  end
end
