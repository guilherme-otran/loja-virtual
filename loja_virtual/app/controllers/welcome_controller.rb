class WelcomeController < ApplicationController
  
  include ProductsController::ProductsPagingAndFilter

  #GET /
  def index    
    # Filter and paginations
    @products = if params[:search]
                  Product.search({ description: params[:search] })
                else
                  Product.scoped
                end

    @products = @products.page(params[:page]).per(8)
    @items = cart.items
    @cart_products = @items.collect { |item| Product.find(item.product_id) }
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
