class WelcomeController < ApplicationController
  
  include ProductsController::ProductsPagingAndFilter

  #GET /
  def index    
    # Filter and pagination for products
    # Initializes the var @products and @categories
    initialize_products_instance_var
    
    # Load cart items
    @items = cart.items
    @cart_products = @items.collect { |item| Product.find(item.product_id) }
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
