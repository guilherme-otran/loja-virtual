class WelcomeController < ApplicationController
  
  include ProductsController::ProductsPagingAndFilter

  #GET /
  def index    
    # Filter and paginations
    @products = Product.search(params[:search])
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(4)

      #@products = Product.page(params[:page]).per(8)
      @items = cart.items
      @cart_products = @items.collect { |item| Product.find(item.product_id) }
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
