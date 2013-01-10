class WelcomeController < ApplicationController  
  include ProductFilterPaginator
  
  include CartManager
  helper_method :cart
  
  #GET /
  def index   
    # Load categories for filter products
    @categories = Category.all
     
    filter_products # Don't remove - makes /products/categories/:id work
    paginate_products
    
    load_cart_items
    
    respond_to do |format|
      format.html do
        render partial: "products/index" if request.xhr?
      end
      format.js { render partial: "products/index" }
      format.json { render json: @products }
    end
  end
end
