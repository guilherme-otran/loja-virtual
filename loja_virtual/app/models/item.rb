class Item
  attr_accessor :product_id, :quantity
  
  def initialize(product_id)
    @product_id = product_id
    @quantity = 1
  end

  def decrement_quantity
    @quantity -= 1
  end
  
  def increment_quantity
    @quantity += 1
  end
end
