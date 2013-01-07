module Admin::ProductsHelper

  def form_select_categories
      Category.all.map do |c|
        [c.name, c.id]
      end
  end
end
