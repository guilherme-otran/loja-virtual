class Cart
  
  attr_reader :items
  
  def initialize(items = [])
    @items = items
  end
  
  def add_item(product_id)
    current_item = @items.find { |item| item.product_id == product_id }

    if current_item
      return false
    else
      @items << Item.new(product_id)
      return true
    end
  end
  
  def remove_item(product_id)
    current_item = @items.index { |item| item.product_id == product_id }
    
    @items.delete_at(current_item) if current_item
  end
  
  def change_quantity(product_id,new_quantity)
    item_id = @items.index { |item| item.product_id == product_id }
    
    @items[item_id].quantity = new_quantity if item_id
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

  def product_price(product)
    product.price * (@items.find { |item| item.product_id == product.id}).quantity
  end
  def total_value
    total_value = 0
    @items.each do |item|
      current_product = Product.find(item.product_id)
      total_value += current_product.price * item.quantity
    end
    total_value
  end
end
