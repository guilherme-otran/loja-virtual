module CartHelper

  def product_number(product)
    (cart.product_index(product)+1).to_s
  end
  
  def product_quantity(product)
    cart.product_quantity(product).to_s
  end  

  def product_price(product)
    cart.product_price(product).to_s
  end
end
