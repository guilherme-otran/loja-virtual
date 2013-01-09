class Cart
  
  attr_reader :items
  
  def initialize (items = [])
    @items = items
  end
  
  def add_item(product_id)
    current_item = @items.find { |item| item.product_id == product_id }
    
    if current_item
      current_item.increment_quantity    
    else
      @items << Item.new(product_id)
    end
  end
  
  def items_count
    @items.map(&:quantity).inject(:+) || 0
  end
  
  def product_quantity(product)
    @items[product_index(product)].quantity
  end
  
  def product_index(product)
    @items.index { |item| item.product_id == product.id }
  end
end
