module UsersHelper
  def sale_number(sale)
    current_user.sales.index(sale)
  end

  def total_value(arg)
    if arg.kind_of?(SaleItem)
      arg.quantity * arg.product_price
    elsif arg.kind_of?(Sale)
      arg.sale_items.inject(0) { |memo, item| memo + item.quantity * item.product_price }
    end
      
  end
end