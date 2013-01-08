class CartController < ApplicationController
  def show
    
    @items = cart.items
    @products = @items.collect { |item| Product.find(item.product_id) }
    
    # GET /cart/show.html
    # GET /cart/show.json    
    respond_to do |format|
      format.html #
      format.json { render json: @items }
    end
  end
end
