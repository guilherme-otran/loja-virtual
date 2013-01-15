class Item
  attr_accessor :product_id, :quantity
  
  def initialize(product_id)
    @product_id = product_id
    @quantity = 1
  end

  def product
    @product ||= Product.find(product_id) if product_id
  end
end
