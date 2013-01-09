class WelcomeController < ApplicationController
  #GET /
  def index
    
      @products = Product.page(params[:page]).per(8)
      @items = cart.items
      @cart_products = @items.collect { |item| Product.find(item.product_id) }
    
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
      end
  end
end
