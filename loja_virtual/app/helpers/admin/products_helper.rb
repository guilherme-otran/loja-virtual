module Admin::ProductsHelper

  def form_select_categories
      Category.all.map do |c|
        [c.name, c.id]
      end
  end

  def format_product_price
    return "" if (@product.price.nil?)
    number_to_currency(@product.price).gsub("R$ ", "")
  end
end
