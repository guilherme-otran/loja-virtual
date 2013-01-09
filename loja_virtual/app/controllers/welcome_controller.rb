class WelcomeController < ApplicationController
  
  include ProductFilterPaginator
  #GET /
  def index   
    # Load categories for filter products
    @categories = Category.all
     
    # Initialize @products
    load_filtered_and_pagined_products
    
    # Load cart items
    @items = cart.items
    @cart_products = @items.collect { |item| Product.find(item.product_id) }
    
    respond_to do |format|
      format.html do
        render partial: "products/index" if request.xhr?
      end
      format.js { render partial: "products/index" }
      format.json { render json: @products }
    end
  end
end
